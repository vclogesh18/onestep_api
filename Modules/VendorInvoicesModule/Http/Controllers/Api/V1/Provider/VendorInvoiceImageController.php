<?php

namespace Modules\VendorInvoicesModule\Http\Controllers\Api\V1\Provider;

use Illuminate\Routing\Controller;
use Illuminate\Http\Request;
use Modules\VendorInvoicesModule\Entities\VendorInvoiceImage;
use Illuminate\Support\Facades\Storage;

class VendorInvoiceImageController extends Controller
{
    /**
     * Update Vendor Invoice Image
     */
    public function updateImage(Request $request, $invoiceId)
    {   
        $new_image = $request->file('image');

        $image = VendorInvoiceImage::where('vendor_invoice_id', $invoiceId)
            ->where('id', $request->image_id)
            ->firstOrFail();

        
        $image->status_flag = 'D'; // Deactivate
        $image->updated_at = now();
        $image->save();

        // create new image
        $path = $new_image->store("uploads/vendor_invoices/{$invoiceId}", 'public');
                
        VendorInvoiceImage::create([
            'vendor_invoice_id' => $invoiceId,
            'path' => $path,
            'description' => $request->description ?? $image->description, // match description by index
        ]);

        return response()->json([
            'message' => 'Image updated successfully',
            'url' => asset("public/storage/{$path}")
        ]);
    }
        /**
     * Delete Vendor Invoice Image (Soft Delete)
     */
    public function deleteImage(Request $request, $invoiceId)
    {
        $request->validate([
            'image_id' => 'required|integer',
        ]);
        
        $image = VendorInvoiceImage::where('vendor_invoice_id', $invoiceId)
            ->where('id', $request->image_id)
            ->firstOrFail();

        $image->status_flag = 'D'; // Soft delete
        $image->updated_at = now();
        $image->save();

        return response()->json([
            'message' => 'Image deleted successfully',
            'data' => $image
        ]);
    }

}


?>