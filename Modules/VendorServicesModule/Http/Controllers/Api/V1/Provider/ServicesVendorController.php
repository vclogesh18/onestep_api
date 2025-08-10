<?php

namespace Modules\VendorServicesModule\Http\Controllers\Api\V1\Provider;

use Illuminate\Http\JsonResponse;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Routing\Controller;
use Modules\VendorServicesModule\Entities\VendorServices;

class ServicesVendorController extends Controller {
    private VendorServices $vendorServices;

    public function __construct(VendorServices $vendorServices) {
        $this->vendorServices = $vendorServices;
    }

    /**
     * Display a listing of the resource.
     * @param Request $request
     * @return JsonResponse
     */

    public function index() {
        $services = $this->vendorServices->get();
        if (isset($services)) {
            return response()->json(response_formatter(DEFAULT_200, $services), 200);
        }
        return response()->json(response_formatter(DEFAULT_204), 200);
    }


    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(),[
            'service_name' => 'required',
            'unit_price' => 'required',
            'quantity' => 'required',
            'tax' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(response_formatter(DEFAULT_400, null, error_processor($validator)), 400);
        }

        $req = $request->all();

        $service = new VendorServices();
        $service->service_name = $req['service_name'];
        $service->unit_price = $req['unit_price'];
        $service->quantity = $req['quantity'];
        $service->tax = $req['tax'];
        $service->size = $req['size'];
        $service->save();

        return response()->json(['message' => 'Vendor Services saved successfully', 'service' => $service], 201);
    }

}


