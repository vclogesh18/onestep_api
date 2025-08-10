<?php
namespace Modules\VendorCustomersModule\Http\Controllers\Api\V1\Provider;

use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Illuminate\Http\Request;
use Illuminate\Contracts\Support\Renderable;
use Modules\VendorCustomersModule\Entities\VendorCustomers;
use Illuminate\Support\Facades\Validator;



class VendorCustomersController extends Controller {
    private VendorCustomers $vendorCustomers;

    public function __construct(VendorCustomers $vendorCustomers) {
        $this->vendorCustomers = $vendorCustomers;
    }

    public function index(Request $request): JsonResponse {
        $customers = $this->vendorCustomers->get();
        if (isset($customers)) {
            return response()->json(response_formatter(DEFAULT_200, $customers), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'phone' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $req = $request->all();

        $customer = new VendorCustomers();
        $customer->name = $req['name'];
        $customer->phone = $req['phone'];
        $customer->email = $req['email'];
        $customer->bitlling_address = $req['address']; 
        $customer->save();

        return response()->json(['message' => 'Vendor Customer saved successfully', 'customer' => $customer], 201);
    }
}