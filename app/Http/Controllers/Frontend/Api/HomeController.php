<?php

namespace App\Http\Controllers\Frontend\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Product;
use App\Models\Postcode;
use App\Models\Category;
class HomeController extends Controller
{
    public function index(){
        
        if(session_status() === PHP_SESSION_NONE) session_start();
        $products = Product::get();
        $data =[];
        foreach ($products as $product) {
            $image = "https://livsham.softwarebyte.co/frontend/images/no-item.png";
            if($product->images->isNotEmpty())
            {
                $image = "https://livsham.softwarebyte.co/".$product->images[0]->path;
            };
             $product_category = null;
             $product_category_id = null;
             
            if($product->getcategory){
                $product_category_id = $product->getcategory->id;
                $product_category = $product->getcategory->name;
                
            }
            $getsubcategory = null;
            $getsubcategory_id = null;
            if($product->getsubcategory){

                $getsubcategory_id = $product->getsubcategory[0]->id;
                $getsubcategory = $product->getsubcategory[0]->name;
                
            }
            $getsubsubcategory = null;
             $getsubsubcategory_id = null;
            if($product->getsubsubcategory){
                $getsubsubcategory_id = $product->getsubsubcategory[0]->id;
                $getsubsubcategory = $product->getsubsubcategory[0]->name;
                
            }
            $is_favourite = false;
            if(auth()->check()){
                $is_favourite = auth()->user()->is_favourite($product->id);
            }
            $item_qty  = 0;
            if(isset($_SESSION['cart'])){
                if(array_key_exists($product->id,$_SESSION['cart'])){
                    $item_qty = $_SESSION['cart'][$product->id];
                }
            }
            
            if(!strlen(filter_var($product->product_information, FILTER_SANITIZE_STRING))){
             $product->product_information = null;   
            }
            if(!strlen(filter_var($product->ingredients, FILTER_SANITIZE_STRING))){
                $product->ingredients = null;
            }
            if(!strlen(filter_var($product->storage, FILTER_SANITIZE_STRING))){
                $product->storage = null;
            }
            if(!strlen(filter_var($product->other_information, FILTER_SANITIZE_STRING))){
                $product->other_information = null;
            }
            if(!strlen(filter_var($product->nutritional_content, FILTER_SANITIZE_STRING))){
                $product->nutritional_content = null;
            }
            $item = [
              'id' => $product->id,
              'name' => $product->name,
              'category_id' => $product_category_id,
              'category' => $product_category,
              'sub_category_id' => $getsubcategory_id,
              'sub_category' => $getsubcategory,
              'subsub_category_id' => $getsubsubcategory_id,
              'subsub_category' => $getsubsubcategory,
              'is_favourite' => $is_favourite,
              'cart_quantity' => $item_qty,
              'product_information' => $product->product_information,
              'origin' => $product->origin,
              'image' => $image,
              'ingredients' => $product->ingredients,
              'nutritional_content' => $product->nutritional_content,
              'storage' => $product->storage,
              'other_information' => $product->other_information,
              'price' => $product->price,
              'price_per_item' => $product->price_per_item,
              'compare_price' => $product->compare_price,
              'status' => $product->status,
              'weight'=> $product->weight,
              'item_status' => $product->item_status,
              'discount_price' => $product->discount_price,
          
            ];
            array_push($data, $item);
            // $data[$product->id] = $item;
          }

        return response()->json($data);
        
    }
}
