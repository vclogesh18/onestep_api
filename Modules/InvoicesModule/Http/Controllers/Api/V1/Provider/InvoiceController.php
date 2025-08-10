<?php

namespace Modules\InvoicesModule\Http\Controllers\Api\V1\Provider;

use Illuminate\Http\JsonResponse;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Routing\Controller;
use Modules\InvoicesModule\Entities\Invoices;

class InvoiceController extends Controller
{

    private Invoices $invoice;

    public function __construct(Invoices $invoices) {
        $this->invoice = $invoices;
    }


    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(),[
            'customer_name' => 'required',
            'address' => 'nullable',
            'email' => 'nullable',
            'mobile' => 'required',
            'event_date' => 'required|date',
            'invoice_items' => 'array|required',
            'invoice_items.*.description' => 'required',
            'invoice_items.*.quantity' => 'required|numeric',
            'invoice_items.*.price' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $invoice = $request->all();

        $invoice['provider_id'] = $request->user()->id;

        $invoice = Invoices::create($request->all());

        foreach ($request['invoice_items'] as $lineItemData) {
            $invoice->InvoiceItems()->create($lineItemData);
        }

        return response()->json(['message' => 'Invoice saved successfully', 'invoice' => $invoice], 201);
    }

    public function all() {
        $invoice = $this->invoice->with(['InvoiceItems'])->get();
        if (isset($invoice)) {
            return response()->json(response_formatter(DEFAULT_200, $invoice), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);

    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        $invoice = $this->invoice->with(['InvoiceItems'])->where(['id' => $id])->first(); 
        if (isset($invoice)) {
            return response()->json(response_formatter(DEFAULT_200, $invoice), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('invoicesmodule::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        //
    }
}
