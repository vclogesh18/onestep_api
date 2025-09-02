<?php

namespace Modules\VendorInvoicesModule\Entities;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VendorInvoices extends Model
{
    use HasFactory;

    use HasUuid;

    protected $fillable = [
        'id',
        'readable_id',
        'customer_id',
        'provid',
        'customer_name',
        'address',
        'email',
        'mobile',
        'event_type',
        'event_date',
        'event_end_date',
        'meal_type',
        'invoice_date',
        'state',
        'is_taxable',
        'is_paid',
        'sub_total',
        'total_tax',
        'total',
        'latitude',
        'longitude',
        'gstin',
        'event_place',
        'billing_address'
    ];

    public function ExpenseItems() : HasMany
    {
        return $this->hasMany(VendorExpenses::class);
    }

    public function InvoiceItems() : HasMany
    {
        return $this->hasMany(VendorInvoicesItems::class);
    }

    public function scopeOfBookingStatus($query, $status)
    {
        $query->where('booking_status', '=', $status);
    }


    protected static function newFactory()
    {
        return \Modules\VendorInvoicesModule\Database\factories\VendorInvoicesFactory::new();
    }

    public static function boot()
    {
        parent::boot();

        self::creating(function ($model) {
            $model->readable_id = $model->count() + 100000;
        });
    }

    public function images()
    {
        return $this->hasMany(VendorInvoiceImage::class, 'vendor_invoice_id')
                    ->active();
    }
}
