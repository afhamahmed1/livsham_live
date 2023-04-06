<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    use HasFactory;
    public $incrementing = false;
    protected $casts = [
        'id' => 'string'
    ];
    protected $table = 'orders';
    protected $fillable = [
        'status',
        'user_id',
    ];
    public function getorder()
    {
        return $this->hasMany(OrderDetail::class, 'order_id','id');
    }
    public function getdeliveryaddress()
    {
        return $this->belongsTo(DeliveryAddress::class, 'delivery_address_id', 'id');
    }
    
    public function getdeliverytime()
    {
        return $this->belongsTo(DeliveryTime::class, 'delivery_time_id','id');
    }
    public function getuser()
    {
        return $this->belongsTo(User::class, 'user_id','id');
    }
  
}
