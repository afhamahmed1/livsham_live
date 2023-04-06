<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryAddress extends Model
{
    use HasFactory;
    
    protected $table = 'delivery_address';
    protected $fillable = [
        'user_id',
        'fname',
        'lname',
        'street_address',
        'zip_code',
        'postal_address',
        'mobile_number',
        'home_phone',
        'port_code',
        'message',
        
    ];
}
