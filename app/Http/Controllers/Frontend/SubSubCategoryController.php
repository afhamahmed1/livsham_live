<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\SubSubCat;
use Illuminate\Http\Request;

class SubSubCategoryController extends Controller
{
    public function index(Request $request){

         $product = Product::with('getsubsubcategory');
         if(request()->sub_sub_category){
                $product =  $product->where('subsub_cat_id',request()->sub_sub_category);
            }
            
          $product =  $product->get();
          $subsub_category = SubSubCat::where('id',request()->sub_sub_category)->get();
          $categories = Category::get();
        return view('frontend.subsub_category' , get_defined_vars());
    }
    
}
