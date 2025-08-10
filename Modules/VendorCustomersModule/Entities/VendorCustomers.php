<?php

namespace Modules\VendorCustomersModule\Entities;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VendorCustomers extends Model
{
    use HasFactory;

    use HasUuid;

    protected $fillable = ['name','phone','email','bitlling_address'];
    
    protected static function newFactory()
    {
        return \Modules\VendorCustomersModule\Database\factories\VendorCustomersFactory::new();
    }
}
