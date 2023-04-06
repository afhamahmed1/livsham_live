<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\SubSubCat;
use Illuminate\Http\Request;

class SubCategoryController extends Controller
{
    public function index(Request $request){

         $product = Product::with('getsubcategory');
         if(request()->sub_category){
                $product =  $product->where('sub_cat_id',request()->sub_category);
            }
            
          $product =  $product->get();
          $subsub_category = SubSubCat::where('sub_cat_id', request()->sub_category)->get();
          $sub_category = SubCategory::where('id', request()->sub_category)->get();
          $categories = Category::get();
        return view('frontend.sub_category' , get_defined_vars());
    }
    
}
