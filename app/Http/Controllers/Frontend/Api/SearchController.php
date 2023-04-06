<?php

namespace App\Http\Controllers\Frontend\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
class SearchController extends Controller
{
    public function index(Request $search)
    {
        $search = $search['search'];
        $products = Product::where('name', 'like', '%'.$search.'%')->get();
        // Load the JSON data from a file or a variable
        $jsonData = file_get_contents('https://livsham.softwarebyte.co/api/products');
        // Decode the JSON data into an array
        $data = json_decode($jsonData, true);
        
        // Loop through the array
        $results = array();
        foreach ($data['data'][0] as $key => $value) {
            
            if (strpos(strtolower($value['name']), strtolower($search)) !== false) {
                array_push($results, $value);
            }
        }
        
        
        // Return the search results as JSON
        return response()->json($results);
    }
    public function test(Request $search){
        
        $products = Product::search('name', 'like', '%'.$search.'%')->get();
          foreach ($products as $product) {
            $image = "https://livsham.softwarebyte.co/frontend/images/no-item.png";
            if($product->images->isNotEmpty())
            {
                $image = "https://livsham.softwarebyte.co/".$product->images[0]->path;
            };
            $product_category = null;
            if($product->getcategory){
                $product_category = $product->getcategory->name;
                
            }
            $getsubcategory = null;
            if($product->getsubcategory){
                $getsubcategory = $product->getsubcategory[0]->name;
                
            }
            $getsubsubcategory = null;
            if($product->getsubsubcategory){
                $getsubsubcategory = $product->getsubsubcategory[0]->name;
                
            }
            $item = [
              'id' => $product->id,
              'name' => $product->name,
              'category' => $product_category,
              'sub_category' => $getsubcategory,
              'subsub_category' => $getsubsubcategory,
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
          }
    }
}
