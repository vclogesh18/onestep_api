<?php

namespace Modules\InvoicesModule\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class InvoiceItem extends Model
{
    use HasFactory;

    protected $fillable = ['description','quantity','price','size'];
    
    protected static function newFactory()
    {
        return \Modules\InvoicesModule\Database\factories\InvoiceItemFactory::new();
    }

    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }
}
