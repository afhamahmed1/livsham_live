<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'category_id',
        'tag_id',
        'product_information',
        'origin',
        'ingredients',
        'nutritional_content',
        'storage',
        'other_information',
        'price',
        'compare_price',
        'status',
        'weight',
        'items_status',
        'discount_price',
        'price_per_item',
        'sub_cat_id',
        'subsub_cat_id',
    ];
    public function getcategory()
    {
        return $this->belongsTo(Category::class, 'category_id','id');
    }
    
    public function getorigin()
    {
        return $this->belongsTo(ProductOrigin::class, 'origin_id','id');
    }
    public function gettrademarks(){
        return $this->belongsToMany(Trademark::class, 'product_trademark');
    }
    public function getdiets(){
        return $this->belongsToMany(Diet::class, 'product_diet');
    }
    
    public function getsubcategory()
    {
        return $this->hasMany(SubCategory::class, 'id','sub_cat_id');
    }
    public function getsubsubcategory()
    {
        return $this->hasMany(SubSubCat::class, 'id','subsub_cat_id');
    }
    public function gettag()
    {
        return $this->belongsTo(Tag::class, 'tag_id','id');
    }
    public function images()
    {
        return $this->hasMany(ProductImage::class, 'product_id');
    }
    public function image()
    {
        return $this->hasOne(ProductImage::class ,'product_id','id');
    }
}
