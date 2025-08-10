<?php

namespace Modules\VendorInvoicesModule\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VendorExpenses extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'vendor_invoices_id',
        'expense_type',
        'amount',
        'date',
        'unit'
    ];

    public function invoice()
    {
        return $this->belongsTo(VendorInvoices::class);
    }
    
    protected static function newFactory()
    {
        return \Modules\VendorInvoicesModule\Database\factories\VendorExpensesFactory::new();
    }
}
