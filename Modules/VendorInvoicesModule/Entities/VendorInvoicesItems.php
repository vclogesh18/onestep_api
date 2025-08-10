<?php

namespace Modules\VendorInvoicesModule\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VendorInvoicesItems extends Model
{
    use HasFactory;

    protected $fillable = [
        'service_name',
        'unit_price',
        'quantity',
        'tax',
        'unit',
        'size'
    ];

    public function invoice()
    {
        return $this->belongsTo(VendorInvoices::class);
    }


    
    protected static function newFactory()
    {
        return \Modules\VendorInvoicesModule\Database\factories\VendorInvoicesItemsFactory::new();
    }
}
