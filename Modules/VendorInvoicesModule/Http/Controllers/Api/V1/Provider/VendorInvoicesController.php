<?php

namespace Modules\VendorInvoicesModule\Http\Controllers\Api\V1\Provider;

use Illuminate\Http\JsonResponse;
use Carbon\Carbon;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Routing\Controller;
use Modules\VendorInvoicesModule\Entities\VendorInvoices;
use Modules\VendorInvoicesModule\Entities\VendorEventType;
use Modules\VendorInvoicesModule\Entities\VendorExpenses;
use Modules\VendorInvoicesModule\Entities\VendorInvoicesItems;
use Modules\VendorCustomersModule\Entities\VendorCustomers;
use Modules\VendorInvoicesModule\Entities\VendorInvoiceImage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use function pagination_limit;

class VendorInvoicesController extends Controller {

    private VendorInvoices $vendorInvoices;
    private VendorInvoicesItems $vendorInvoiceItems;
    private VendorCustomers $vendorCustomers;
    private VendorExpenses $vendorExpenses;
    private VendorEventType $vendorEventType;

    public function __construct(
        VendorInvoices $vendorInvoices, 
        VendorInvoicesItems $vendorInvoiceItems,
        VendorCustomers $vendorCustomers,
        VendorExpenses $vendorExpenses,
        VendorEventType $vendorEventType
    ) {
        $this->vendorInvoices = $vendorInvoices;
        $this->vendorInvoiceItems = $vendorInvoiceItems;
        $this->vendorCustomers = $vendorCustomers;
        $this->vendorExpenses = $vendorExpenses;
        $this->vendorEventType = $vendorEventType;
    }    

    public function index(Request $request): JsonResponse {
        $validator = Validator::make($request->all(), [
            'limit' => 'required|numeric|min:1|max:200',
            'offset' => 'required|numeric|min:1|max:100000',
            'booking_status' => 'required|in:' . implode(',', array_column(BOOKING_STATUSES, 'key')) . ',all',
            'from_date' => 'date',
            'to_date' => 'date',
            'string' => 'string'
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $invoice = $this->vendorInvoices->with(['InvoiceItems','ExpenseItems'])
            ->when($request->has('string'), function ($query) use ($request) {
                $keys = explode(' ', base64_decode($request['string']));
                foreach ($keys as $key) {
                    $query->orWhere('readable_id', 'LIKE', '%' . $key . '%');
                }
            })
            ->where('provider_id', $request->user()->provider->id)  
            ->ofBookingStatus($request['booking_status'])
            ->when($request->has('from_date') && $request->has('to_date'), function ($query) use ($request) {
                $query->where('created_at', '>=', date('Y-m-d 00:00:00', strtotime($request['from_date'])))
                    ->where('created_at', '<=', date('Y-m-d 23:59:59', strtotime($request['to_date'])));
            })->latest()->paginate($request['limit'], ['*'], 'offset', $request['offset'])->withPath('');

        if (isset($invoice)) {
            return response()->json(response_formatter(DEFAULT_200, $invoice), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

    public function event_types(Request $request): JsonResponse {

        $vendorEventTypes = $this->vendorEventType->all()->pluck(
            'name', 
            'id'
          );
          

        if (isset($vendorEventTypes)) {
            return response()->json(response_formatter(DEFAULT_200, $vendorEventTypes), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

    public function store(Request $request): JsonResponse {
        $validator = Validator::make($request->all(),[
            'customer_name' => 'required',
            'address' => 'required',
            'mobile' => 'required',
            'event_date' => 'required',
            'event_type' => 'required',
            'event_end_date' => 'required',
            'state' => 'required',
            'is_taxable' => 'required',
            'invoice_items' => 'array|required',
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $data = $request->all();

        $invoice = new VendorInvoices();
        $invoice->customer_id = $data['customer_id'];
        $invoice->customer_name = $data['customer_name'];
        $invoice->address = $data['address'];
        $invoice->email = $data['email'];
        $invoice->gstin = $data['gstin'];
        $invoice->mobile = $data['mobile'];
        $invoice->event_date = $data['event_date'];
        $invoice->event_type = $data['event_type'];
        $invoice->event_end_date = $data['event_end_date'];
        $invoice->state = $data['state'];
        $invoice->is_taxable = ($data['is_taxable']) ? 1: 0;
        $invoice->is_paid = ($data['is_paid']) ? 1: 0;
        $invoice->sub_total = $data['sub_total'];
        $invoice->meal_type = $data['meal_type'];
        $invoice->total_tax = $data['total_tax'];
        $invoice->total = $data['total'];
        $invoice->latitude = $data['latitude'];
        $invoice->longitude = $data['longitude'];
        $invoice->provider_id = $request->user()->provider->id;
        $invoice->invoice_date = $data['invoice_date'];
        $invoice->event_place = $data['event_place'];
        $invoice->billing_address = $data['billing_address'];
        $invoice->save();

        foreach ($request['invoice_items'] as $lineItemData) {
            $invoice->InvoiceItems()->create($lineItemData);
        }
        
        return response()->json(['message' => 'Invoice saved successfully', 'invoice' => $invoice], 201);
    }

    public function show(Request $request, string $id) {
        $invoice = $this->vendorInvoices->with(['InvoiceItems','ExpenseItems','images'])
                ->where(['id' => $id])->first();  

        if (isset($invoice)) {
            return response()->json(response_formatter(DEFAULT_200, $invoice), 200);
        }   
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

    public function status_update(Request $request, string $booking_id): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'booking_status' => 'required|in:' . implode(',', array_column(BOOKING_STATUSES, 'key')),
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $booking = $this->vendorInvoices->where('id', $booking_id)->where(function ($query) use ($request) {
            return $query->where('provider_id', $request->user()->provider->id)->orWhereNull('provider_id');
        })->first();

        if (isset($booking)) {
            $booking->booking_status = $request['booking_status'];

            if ($booking->isDirty('booking_status')){
                DB::transaction(function () use ($booking) {
                    $booking->save();
                });

                return response()->json(response_formatter(DEFAULT_200, $booking), 200);
            }
            return response()->json(response_formatter(NO_CHANGES_FOUND), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

    public function add_expense(Request $request): JsonResponse {
        $validator = Validator::make($request->all(),[
            'expense_type' => 'required',
            'amount' => 'required',
            'vendor_invoices_id' => 'required',
            'date' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }   
        $data = $request->all();

        $booking = $this->vendorInvoices->where('id', $data['vendor_invoices_id'])->where(function ($query) use ($request) {
            return $query->where('provider_id', $request->user()->provider->id);
        })->first();

        if(isset($booking)) {
            $booking->total_expense = $booking->total_expense + $data['amount'];
            $booking->save();
            $expense = VendorExpenses::create($data);
            return response()->json(['message' => 'Expos saved successfully', 'content' => $expense], 201);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

    public function update(Request $request, string $id): JsonResponse {
        $invoice = [];
        $validator = Validator::make($request->all(),[
            'customer_name' => 'required',
            'address' => 'required',
            'mobile' => 'required',
            'event_date' => 'required',
            'state' => 'required',
            'invoice_items' => 'array|required',
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $invoice = $this->vendorInvoices->where('id', $id)->where(function ($query) use ($request) {
            return $query->where('provider_id', $request->user()->provider->id);
        })->first();

        $data = $request->all();

        $invoice->customer_name = $data['customer_name'];
        $invoice->address = $data['address'];
        $invoice->mobile = $data['mobile'];
        $invoice->event_date = $data['event_date'];
        $invoice->event_end_date = $data['event_end_date'];
        $invoice->event_type = $data['event_type'];
        $invoice->state = $data['state'];
        $invoice->is_taxable = ($data['is_taxable']) ? 1: 0;
        $invoice->is_paid = ($data['is_paid']) ? 1: 0;
        $invoice->meal_type = $data['meal_type'];
        $invoice->email = $data['email'];
        $invoice->gstin = $data['gstin'];
        $invoice->event_place = $data['event_place'];
        $invoice->billing_address = $data['billing_address'];
        if(isset($data['sub_total'])) {
            $invoice->sub_total = $data['sub_total'];
        }
        if(isset($data['total_tax'])) {
            $invoice->total_tax = $data['total_tax'];
        }
        
        if(isset($data['total'])) {
            $invoice->total = $data['total'];
        }

        if(isset($data['latitude'])) {
            $invoice->latitude = $data['latitude'];
        }
       
        if(isset($data['longitude'])) {
            $invoice->longitude = $data['longitude'];
        }
       
        $invoice->provider_id = $request->user()->provider->id;
        $invoice->save();

        foreach ($request['invoice_items'] as $lineItemData) {
            $item = VendorInvoicesItems::findOrNew($lineItemData['id']);
            $item->service_name = $lineItemData['service_name'];
            $item->quantity = $lineItemData['quantity'];
            $item->unit_price = $lineItemData['unit_price'];
            $item->tax = $lineItemData['tax'];
            $item->unit = $lineItemData['unit'];
            $item->size = $lineItemData['size'];
            $item->vendor_invoices_id = $id;
            $item->save();
        }

        return response()->json(['message' => 'Invoice saved successfully', 'invoice' => $invoice], 201);
    }

   public function insights(Request $request): JsonResponse {
        $booking_overview = DB::table('vendor_invoices')->where('provider_id', $request->user()->provider->id)
                ->select('booking_status', DB::raw('count(*) as total'))
                ->groupBy('booking_status')
                ->get();
        $booking_value = $this->vendorInvoices->where('provider_id', $request->user()->provider->id)->sum('total');    
        $expense_value =  $this->vendorInvoices->where('provider_id', $request->user()->provider->id)->sum('total_expense');
        $tax_value =  $this->vendorInvoices->where('provider_id', $request->user()->provider->id)->sum('total_tax'); 
        $profit = $booking_value - ($expense_value + $tax_value);
        $total_bookings = $this->vendorInvoices->where('provider_id', $request->user()->provider->id)->count();
        $data[] = [
            'booking_stats' => $booking_overview, 
            'total_bookings' => $total_bookings, 
            'booking_value' => $booking_value,
            'expense_value' => $expense_value,
            'tax_value' => $tax_value, 
            'profit' => $profit
        ];
        return response()->json(response_formatter(DEFAULT_200, $data), 200);
   }

   public function reporting(Request $request): JsonResponse {

        $validator = Validator::make($request->all(), [
            'date_range' => 'in:all_time,this_week,last_week,this_month,last_month,last_15_days,this_year,last_year,last_6_month,this_year_1st_quarter,this_year_2nd_quarter,this_year_3rd_quarter,this_year_4th_quarter,custom_date',
            'from' => $request['date_range'] == 'custom_date' ? 'required' : '',
            'to' => $request['date_range'] == 'custom_date' ? 'required' : '',
            'booking_status' => 'in:' . implode(',', array_column(BOOKING_STATUSES, 'key')) . ',all',

            'limit' => 'required|numeric|min:1|max:200',
            'offset' => 'required|numeric|min:1|max:100000',
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $search = $request['search'];
        $query_params = ['search' => $search];

       $customers = $this->vendorCustomers->select('id', 'name')->get();

        if ($request->has('date_range')) {
            $query_params['date_range'] = $request['date_range'];
        }
        if ($request->has('date_range') && $request['date_range'] == 'custom_date') {
            $query_params['from'] = $request['from'];
            $query_params['to'] = $request['to'];
        }

        $filtered_bookings = self::filter_query($this->vendorInvoices, $request)
            ->with(['InvoiceItems','ExpenseItems'])
            ->when($request->has('booking_status') && $request['booking_status'] != 'all' , function ($query) use($request) {
                $query->where('booking_status', $request['booking_status']);
            })
            ->latest()->paginate(pagination_limit())
            ->appends($query_params);

        //** Card Data **
        $bookings_for_amount = self::filter_query($this->vendorInvoices, $request)
            ->whereIn('booking_status', ['pending','accepted', 'ongoing', 'completed', 'canceled'])
            ->get();

        $bookings_count = [];
        $bookings_count['total_bookings'] = $bookings_for_amount->count();
        $bookings_count['pending'] = $bookings_for_amount->where('booking_status', 'pending')->count();
        $bookings_count['accepted'] = $bookings_for_amount->where('booking_status', 'accepted')->count();
        $bookings_count['ongoing'] = $bookings_for_amount->where('booking_status', 'ongoing')->count();
        $bookings_count['completed'] = $bookings_for_amount->where('booking_status', 'completed')->count();
        $bookings_count['canceled'] = $bookings_for_amount->where('booking_status', 'canceled')->count();  
        
        $booking_amount = [];
        $booking_amount['total_booking_amount'] = $bookings_for_amount->sum('total');
        $booking_amount['total_tax_amount'] = $bookings_for_amount->sum('total_tax');
        $booking_amount['total_expense_amount'] = $bookings_for_amount->sum('total_expense');
        $booking_amount['total_profit_amount'] =  $booking_amount['total_booking_amount'] - ($booking_amount['total_tax_amount'] + $booking_amount['total_expense_amount']);


        //** Chart Data **

        //deterministic
        $date_range = $request['date_range'];
        if(is_null($date_range) || $date_range == 'all_time') {
            $deterministic = 'year';
        } elseif ($date_range == 'this_week' || $date_range == 'last_week') {
            $deterministic = 'week';
        } elseif ($date_range == 'this_month' || $date_range == 'last_month' || $date_range == 'last_15_days') {
            $deterministic = 'day';
        } elseif ($date_range == 'this_year' || $date_range == 'last_year' || $date_range == 'last_6_month' || $date_range == 'this_year_1st_quarter' || $date_range == 'this_year_2nd_quarter' || $date_range == 'this_year_3rd_quarter' || $date_range == 'this_year_4th_quarter') {
            $deterministic = 'month';
        } elseif($date_range == 'custom_date') {
            $from = Carbon::parse($request['from'])->startOfDay();
            $to = Carbon::parse($request['to'])->endOfDay();
            $diff = Carbon::parse($from)->diffInDays($to);

            if($diff <= 7) {
                $deterministic = 'week';
            } elseif ($diff <= 30) {
                $deterministic = 'day';
            } elseif ($diff <= 365) {
                $deterministic = 'month';
            } else {
                $deterministic = 'year';
            }
        }
        $group_by_deterministic = $deterministic=='week'?'day':$deterministic;

        $bookings = self::filter_query($this->vendorInvoices, $request)
            ->whereIn('booking_status', ['pending','accepted', 'ongoing', 'completed', 'canceled'])
            ->when(isset($group_by_deterministic), function ($query) use ($group_by_deterministic) {
                $query->select(
                    DB::raw('sum(total) as total_booking_amount'),
                    DB::raw('sum(total_tax) as total_tax_amount'),

                    DB::raw($group_by_deterministic.'(created_at) '.$group_by_deterministic)
                );
            })
            ->groupby($group_by_deterministic)
            ->get()->toArray();

        $chart_data = ['booking_amount'=>array(), 'tax_amount'=>array(), 'admin_commission'=>array(), 'timeline'=>array()];
        //data filter for deterministic
        if($deterministic == 'month') {
            $months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            foreach ($months as $month) {
                $found=0;
                $chart_data['timeline'][] = $month;
                foreach ($bookings as $key=>$item) {
                    if ($item['month'] == $month) {
                        $chart_data['booking_amount'][] = $item['total_booking_amount'];
                        $chart_data['tax_amount'][] = $item['total_tax_amount'];
                        $found=1;
                    }
                }
                if(!$found){
                    $chart_data['booking_amount'][] = 0;
                    $chart_data['tax_amount'][] = 0;
                    $chart_data['admin_commission'][] = 0;
                }
            }

        }
        elseif ($deterministic == 'year') {
            foreach ($bookings as $key=>$item) {
                $chart_data['booking_amount'][] = $item['total_booking_amount'];
                $chart_data['tax_amount'][] = $item['total_tax_amount'];
                $chart_data['timeline'][] = $item[$deterministic];
            }
        }
        elseif ($deterministic == 'day') {
            if ($date_range == 'this_month') {
                $to = Carbon::now()->lastOfMonth();
            } elseif ($date_range == 'last_month') {
                $to = Carbon::now()->subMonth()->endOfMonth();
            } elseif ($date_range == 'last_15_days') {
                $to = Carbon::now();
            }

            $number = date('d',strtotime($to));

            for ($i = 1; $i <= $number; $i++) {
                $found=0;
                $chart_data['timeline'][] = $i;
                foreach ($bookings as $key=>$item) {
                    if ($item['day'] == $i) {
                        $chart_data['booking_amount'][] = $item['total_booking_amount'];
                        $chart_data['tax_amount'][] = $item['total_tax_amount'];
                        $found=1;
                    }
                }
                if(!$found){
                    $chart_data['booking_amount'][] = 0;
                    $chart_data['tax_amount'][] = 0;
                    $chart_data['admin_commission'][] = 0;
                }
            }
        }
        elseif ($deterministic == 'week') {
            if ($date_range == 'this_week') {
                $from = Carbon::now()->startOfWeek();
                $to = Carbon::now()->endOfWeek();
            } elseif ($date_range == 'last_week') {
                $from = Carbon::now()->subWeek()->startOfWeek();
                $to = Carbon::now()->subWeek()->endOfWeek();
            }

            for ($i = (int)$from->format('d'); $i <= (int)$to->format('d'); $i++) {
                $found=0;
                $chart_data['timeline'][] = $i;
                foreach ($bookings as $key=>$item) {
                    if ($item['day'] == $i) {
                        $chart_data['booking_amount'][] = $item['total_booking_amount'];
                        $chart_data['tax_amount'][] = $item['total_tax_amount'];
                        $found=1;
                    }
                }
                if(!$found) {
                    $chart_data['booking_amount'][] = 0;
                    $chart_data['tax_amount'][] = 0;
                    $chart_data['admin_commission'][] = 0;
                }
            }
        }

        $data = [
            'customers' => $customers,
            'filtered_bookings' => $filtered_bookings,
            'bookings_count' => $bookings_count,
            'booking_amount' => $booking_amount,
            'chart_data' => $chart_data,
        ];
        return response()->json(response_formatter(DEFAULT_200, $data), 200);
   }

   public function expenseReporting(Request $request): JsonResponse {
        $validator = Validator::make($request->all(), [
            'date_range' => 'in:all_time,this_week,last_week,this_month,last_month,last_15_days,this_year,last_year,last_6_month,this_year_1st_quarter,this_year_2nd_quarter,this_year_3rd_quarter,this_year_4th_quarter,custom_date',
            'from' => $request['date_range'] == 'custom_date' ? 'required' : '',
            'to' => $request['date_range'] == 'custom_date' ? 'required' : '',

            'limit' => 'required|numeric|min:1|max:200',
            'offset' => 'required|numeric|min:1|max:100000',
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $search = $request['search'];
        $query_params = ['search' => $search];

        if ($request->has('date_range')) {
            $query_params['date_range'] = $request['date_range'];
        }
        if ($request->has('date_range') && $request['date_range'] == 'custom_date') {
            $query_params['from'] = $request['from'];
            $query_params['to'] = $request['to'];
        }

        $filtered_bookings = self::filter_query($this->vendorInvoices, $request)
            ->with(['InvoiceItems','ExpenseItems' => function($query) use ($request){
                if ($request->has('expense_type') && $request['expense_type'] != null) {
                    $query->where('expense_type', $request['expense_type']);
                }
            }])->withSum(['ExpenseItems'=> function($query) use ($request){
                if ($request->has('expense_type') && $request['expense_type'] != null) {
                    $query->where('expense_type', $request['expense_type']);
                }
            }], 'amount')
            ->latest()->paginate(pagination_limit())
            ->appends($query_params);

         $expenses = $this->vendorExpenses->select('expense_type')->groupBy('expense_type')->get();

        $booking_amount = [];
        $booking_amount['total_expense_amount'] = $filtered_bookings->sum('expense_items_sum_amount');
        $booking_amount['total_booking_amount'] = $filtered_bookings->sum('total');
        $booking_amount['total_tax_amount'] = $filtered_bookings->sum('total_tax');

         $data = [
            'expenses' => $expenses,
            'filtered_bookings' => $filtered_bookings,
            'booking_amount' => $booking_amount
            // 'bookings_count' => $bookings_count,
            // 'chart_data' => $chart_data,
        ];
        return response()->json(response_formatter(DEFAULT_200, $data), 200);
   }

   public function update_expense(Request $request, $id) {
        $validator = Validator::make($request->all(),[
            'expense_type' => 'required',
            'amount' => 'required',
            'date' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $item = VendorExpenses::findOrNew($id);
        $item->expense_type = $request->expense_type;
        $item->amount = $request->amount;
        $item->date = $request->date;
        $item->save();
        return response()->json(['message' => 'Expense saved successfully', 'expense' => $request->all()], 201);
   }

   public function delete_expense(Request $request, $id) {
        $expense = $this->vendorExpenses->where(['id' => $id]);

        if($expense->count() > 0) {
            $expense->forceDelete();
            return response()->json(response_formatter(DEFAULT_DELETE_200), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

   public function destroy(Request $request, $id) {
        
        $invoice = $this->vendorInvoiceItems->where(['id' => $id]);

        if($invoice->count() > 0) {
            $invoice->forceDelete();
            return response()->json(response_formatter(DEFAULT_DELETE_200), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
   }

   public function invoiceDestroy(Request $request, $id) {

    $invoice = $this->vendorInvoices->where(['id' => $id]);
   
    if($invoice->count() > 0) {
        $invoice->forceDelete();
        return response()->json(response_formatter(DEFAULT_DELETE_200), 200);
    }
    return response()->json(response_formatter(DEFAULT_204), 200);
   }

   public function calender(Request $request) {
    $validator = Validator::make($request->all(), [
        'limit' => 'required|numeric|min:1|max:200',
        'offset' => 'required|numeric|min:1|max:100000',
        'from_date' => 'date',
        'to_date' => 'date',
        'string' => 'string'
    ]);

    if ($validator->fails()) {
        return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
    }

    $invoice = $this->vendorInvoices->with(['InvoiceItems','ExpenseItems'])
        ->when($request->has('string'), function ($query) use ($request) {
            $keys = explode(' ', base64_decode($request['string']));
            foreach ($keys as $key) {
                $query->orWhere('readable_id', 'LIKE', '%' . $key . '%');
            }
        })
        ->where('provider_id', $request->user()->provider->id)  
        ->when($request->has('from_date') && $request->has('to_date'), function ($query) use ($request) {
            $query->where('event_date', '>=', date('Y-m-d 00:00:00', strtotime($request['from_date'])))
                ->where('event_date', '<=', date('Y-m-d 23:59:59', strtotime($request['to_date'])));
        })->latest()->paginate($request['limit'], ['*'], 'offset', $request['offset'])->withPath('');

      

        if (isset($invoice)) {
            $invoices = $invoice;
            $transformedData = $invoice->map(function ($invoice) {
                $subject = "{$invoice->customer_name}, {$invoice->address}, {$invoice->mobile}";
                $start_date = $invoice->event_date;
                $end_date = Carbon::parse($invoice->event_date)->addHours(3)->toDateTimeString();
            
                return [
                    'event_id' => $invoice->readable_id,
                    'subject' => $subject,
                    'start_date' => $start_date,
                    'end_date' => $end_date,
                    'meal_type' => $invoice->meal_type
                ];
            })->toArray();
            return response()->json(response_formatter(DEFAULT_200, $transformedData), 200);
        }


        return response()->json(response_formatter(DEFAULT_204), 200);
   }

   function filter_query($instance, $request): mixed
    {
        return $instance
            ->where('provider_id', $request->user()->provider->id)
            ->when($request->has('date_range') && $request['date_range'] == 'custom_date', function ($query) use($request) {
                $query->whereBetween('created_at', [Carbon::parse($request['from'])->startOfDay(), Carbon::parse($request['to'])->endOfDay()]);
            })
            ->when($request->has('customer_id') && $request['customer_id'] != null, function($query) use($request) {
                $query->where('customer_id', $request['customer_id']);
            })
            ->when($request->has('date_range') && $request['date_range'] != 'custom_date', function ($query) use($request) {
                //DATE RANGE
                if($request['date_range'] == 'this_week') {
                    //this week
                    $query->whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);

                } elseif ($request['date_range'] == 'last_week') {
                    //last week
                    $query->whereBetween('created_at', [Carbon::now()->subWeek()->startOfWeek(), Carbon::now()->subWeek()->endOfWeek()]);

                } elseif ($request['date_range'] == 'this_month') {
                    //this month
                    $query->whereMonth('created_at', Carbon::now()->month);

                } elseif ($request['date_range'] == 'last_month') {
                    //last month
                    $query->whereMonth('created_at', Carbon::now()->subMonth()->month);

                } elseif ($request['date_range'] == 'last_15_days') {
                    //last 15 days
                    $query->whereBetween('created_at', [Carbon::now()->subDay(15), Carbon::now()]);

                } elseif ($request['date_range'] == 'this_year') {
                    //this year
                    $query->whereYear('created_at', Carbon::now()->year);

                } elseif ($request['date_range'] == 'last_year') {
                    //last year
                    $query->whereYear('created_at', Carbon::now()->subYear()->year);

                } elseif ($request['date_range'] == 'last_6_month') {
                    //last 6month
                    $query->whereBetween('created_at', [Carbon::now()->subMonth(6), Carbon::now()]);

                } elseif ($request['date_range'] == 'this_year_1st_quarter') {
                    //this year 1st quarter
                    $query->whereBetween('created_at', [Carbon::now()->month(1)->startOfQuarter(), Carbon::now()->month(1)->endOfQuarter()]);

                } elseif ($request['date_range'] == 'this_year_2nd_quarter') {
                    //this year 2nd quarter
                    $query->whereBetween('created_at', [Carbon::now()->month(4)->startOfQuarter(), Carbon::now()->month(4)->endOfQuarter()]);

                } elseif ($request['date_range'] == 'this_year_3rd_quarter') {
                    //this year 3rd quarter
                    $query->whereBetween('created_at', [Carbon::now()->month(7)->startOfQuarter(), Carbon::now()->month(7)->endOfQuarter()]);

                } elseif ($request['date_range'] == 'this_year_4th_quarter') {
                    //this year 4th quarter
                    $query->whereBetween('created_at', [Carbon::now()->month(10)->startOfQuarter(), Carbon::now()->month(10)->endOfQuarter()]);
                }
            });
    }
    
    public function uploadImages(Request $request, $id)
    {
        

        $uploadedPaths = [];
        $images = $request->file('images');

        if (!$images) {
            return response()->json(['error' => 'No files received'], 400);
        }


        $images = is_array($images) ? $images : [$images];



       // echo "images validated";
       // print_r($request->file('images'));

       foreach ($images as $image) {
            if ($image->isValid()) {
                $path = $image->store("uploads/vendor_invoices/{$id}", 'public');
                VendorInvoiceImage::create([
                    'vendor_invoice_id' => $id,
                    'path' => $path,
                    'description' => $request->description, // store description
                ]);
                $urls[] = asset("public/storage/{$path}");
            }
        }

        return response()->json([
            'message' => 'Images uploaded successfully',
            'urls' => $urls
        ]);
    }
}
