<?php

namespace Modules\InvoicesModule\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Invoices extends Model
{
    use HasFactory;

    protected $fillable = [
        'customer_name', 'address', 'email', 'mobile', 'event_date','provider_id'
    ];

    public function InvoiceItems() : HasMany
    {
        return $this->hasMany(InvoiceItem::class);
    }
    
    protected static function newFactory()
    {
        return \Modules\InvoicesModule\Database\factories\InvoicesFactory::new();
    }
}
