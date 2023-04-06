<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\DeliveryAddress;

class ProfileController extends Controller
{
    public function index(){
        $categories = Category::get();
        $delivery_addresses = DeliveryAddress::where('id',1)->get();
        return view('frontend.profile', get_defined_vars());
    }
    
    public function add_address(Request $request){
        $delivery_address = new DeliveryAddress();
        $delivery_address->user_id = auth()->user()->id;
        $delivery_address->fname = $request->fname;
        $delivery_address->lname = $request->fname;
        $delivery_address->street_address = $request->street_address;
        $delivery_address->zip_code = $request->zip_code;
        $delivery_address->postal_address = $request->postal_address;
        $delivery_address->mobile_number = $request->mobile_number;
        $delivery_address->home_phone = $request->home_phone;
        $delivery_address->port_code = $request->port_code;
        $delivery_address->message = $request->message;
        $delivery_address->save();
        return redirect()->back();
    }
}
