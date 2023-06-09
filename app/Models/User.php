<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\Favourites;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'l_name',
        'email',
        'role',
        'status',
        'image',
        'password',
        
        ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function getorders()
    {
        return $this->hasMany(Orders::class, 'user_id','id');
    }
    
    public function favourite_products()
    {
        return $this->belongsToMany(Product::class, 'favourites', 'user_id', 'product_id');
    }
    public function is_favourite($id){
        return Favourites::where('user_id', auth()->user()->id)->where('product_id', $id)->count() > 0 ? 1 : 0; 
    }
}
