<?php

namespace Modules\VendorInvoicesModule\Entities;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VendorEventType extends Model
{
    use HasFactory;

    use HasUuid;

    protected $fillable = [
        'id',
        'name',
        'created_at'
    ];  





    protected static function newFactory()
    {
        return \Modules\VendorInvoicesModule\Database\factories\VendorEventTypeFactory::new();
    }

    public static function boot()
    {
        parent::boot();

        self::creating(function ($model) {
            $model->created_at = date('Y-m-d h:i:s');
        });
    }
}
