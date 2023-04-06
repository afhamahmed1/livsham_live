<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\Postcode;
use App\Models\Category;
use Auth;
use View;
class HomeController extends Controller
{ 
    public function index(Request $request){

     
     
        if ($request->ajax()) {
            $product_weekly = Product::where('discount_price','>', '0')->with('getcategory','image')->get();
              $product_popular = Product::where('items_status', 'Popular')->with('getcategory','image')->get();
            $view = View::make('frontend.index',compact('product_weekly','product_popular'));
             $sections = $view->renderSections(); 
             return $sections['content'];

        }
           $product_weekly = Product::where('discount_price','>', '0')->with('getcategory','image')->get();
           $product_popular = Product::where('items_status', 'Popular')->with('getcategory','image')->get();
           
          $categories = Category::get();
        return view('frontend.index', get_defined_vars());
    }
    public function showproduct(Request $request)
   {
      $product = Product::all();
       $product = Product::where('name', 'LIKE', '%'.$request->searchbar. '%')->get();
      $search = $request->searchbar;
    //   return response()->json([
    //      'product' => $product
    //   ]);
    
    
          $categories = Category::get();
    return view('frontend.search', get_defined_vars());
    }
     public function display_product(Request $request )
     {
        
        // return $request;

        if ($request->ajax()) {
             $product =  Product::where('id',$request->id)->with('image')->first();
             $next = Product::where('items_status', $request->type,"AND")->where('id', '>', $product->id)->min('id');
             $pre = Product::where('items_status', $request->type,"AND")->where('id', '<', $product->id)->max('id');
             $data = [];
             $data['product'] = $product;
             $data['pre'] = $pre;
             $data['next'] = $next;
             return $data;
        }
        
          $categories = Category::get();
        return view('frontend.index', get_defined_vars());

     }
     
     public function set_post_code_session(Request $request){
         session_start();
         $postcode = $request->postcode_1.$request->postcode_2.$request->postcode_3.$request->postcode_4.$request->postcode_5;
         $check = Postcode::where('postcode', $postcode)->first();
         if($check){
            $_SESSION['postcode'] = $postcode;
            unset($_SESSION['delivery_datetime']);
         }else{
             return redirect()->route('index')->with(['error'=>"Tyvärr kan vi inte leverera till denna adress, lämna ditt email och vi meddelar när vi kan köra ut till dig!"]);
         }
         
         return redirect()->back();
     }
     public function get_post_code_session(){
         session_start();
         if(isset($_SESSION['postcode'])){
             
         return response()->json($_SESSION['postcode']);
         }
         return response()->json([]);
     }

}
