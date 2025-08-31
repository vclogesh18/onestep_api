<?php
namespace Modules\VendorInvoicesModule\Entities;

use Illuminate\Database\Eloquent\Model;

class VendorInvoiceImage extends Model
{
    protected $fillable = ['vendor_invoice_id', 'path','description', 'status_flag'];

    protected $appends = ['url'];

    public function getUrlAttribute()
    {
        return asset('public/storage/' . $this->path);
    }

    public function invoice()
    {
        return $this->belongsTo(VendorInvoice::class, 'vendor_invoice_id');
    }

    public function scopeActive($query)
    {
        return $query->where('status_flag', 'A');
    }
}
?>