<?php

namespace Modules\VendorServicesModule\Entities;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VendorServices extends Model
{
    use HasFactory;

    use HasUuid;

    protected $fillable = ['id','service_name','unit_price','quantity','tax','size'];
    
    protected static function newFactory()
    {
        return \Modules\VendorServicesModule\Database\factories\VendorServicesFactory::new();
    }
}
