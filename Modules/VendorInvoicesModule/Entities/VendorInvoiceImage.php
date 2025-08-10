<?php
namespace Modules\VendorInvoicesModule\Entities;

use Illuminate\Database\Eloquent\Model;

class VendorInvoiceImage extends Model
{
    protected $fillable = ['vendor_invoice_id', 'path','description'];

    protected $appends = ['url'];

    public function getUrlAttribute()
    {
        return asset('public/storage/' . $this->path);
    }

    public function invoice()
    {
        return $this->belongsTo(VendorInvoice::class, 'vendor_invoice_id');
    }
}
?>