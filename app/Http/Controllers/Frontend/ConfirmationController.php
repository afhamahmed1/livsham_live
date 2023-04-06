<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\Http;
use App\Models\Orders;
use App\Models\OrderDetail;
use App\Models\DeliveryAddress;
use App\Models\DeliveryTime;
use Illuminate\Support\Facades\Mail;
use App\Mail\ConfirmationEmail;
use App\Models\CouponUser;

class ConfirmationController extends Controller
{
    public function index(Request $request){
        
        if (session_status() === PHP_SESSION_NONE) session_start();
        
        $categories = Category::get();
        // dd($request->order_id);
        $response = Http::withHeaders(['Authorization' => "Basic UEs3MDY1M19mNzQyMTYzOGVlNWM6ck5JQnpSUjlFOGI4TDlzSg==", "Content-Type" => "application/json" ])->get('https://api.playground.klarna.com/checkout/v3/orders/'.$request->order_id);
        $klarna_order_confirmation = json_decode($response->body());
        
        $order = Orders::where('id', $klarna_order_confirmation->order_id)->first();
        if(!$order){
            $delivery = new DeliveryAddress();
            $delivery->fname = $klarna_order_confirmation->shipping_address->given_name;
            $delivery->lname = $klarna_order_confirmation->shipping_address->family_name;
            $delivery->email = $klarna_order_confirmation->shipping_address->email;
            $delivery->street_address = $klarna_order_confirmation->shipping_address->street_address;
            $delivery->postal_code = $klarna_order_confirmation->shipping_address->postal_code;
            $delivery->city = $klarna_order_confirmation->shipping_address->city;
            $delivery->phone = $klarna_order_confirmation->shipping_address->phone;
            $delivery->country = $klarna_order_confirmation->shipping_address->country;
            $delivery->save();
            
            $deliverytimesession = $_SESSION['delivery_datetime'];
            $deliverytime = DeliveryTime::where('date', $deliverytimesession['delivery_date'])
                                        ->where('start_time', $deliverytimesession['start_time'])
                                        ->where('end_time', $deliverytimesession['end_time'])->first();
            if($deliverytime){
                if($deliverytime->no_of_orders >= 4){
                    $deliverytime->status = 0;
                }
                $deliverytime->no_of_orders = $deliverytime->no_of_orders + 1; 
                $deliverytime->save();
            }else{
                
                $deliverytime = new DeliveryTime();
                $deliverytime->start_time = $deliverytimesession['start_time'];
                $deliverytime->end_time = $deliverytimesession['end_time'];
                $deliverytime->date = $deliverytimesession['delivery_date'];
                $deliverytime->status = 1;
                $deliverytime->no_of_orders = 1;
                $deliverytime->save();
            }
            unset($_SESSION['delivery_datetime']);
            
            $order = new Orders();
            $order->id = $klarna_order_confirmation->order_id;
            $order->user_id = (auth()->user()) ? auth()->user()->id : null;
            
            if(isset($_SESSION['recurring_delivery'])){
                $order->recurring_delivery = $_SESSION['recurring_delivery'];
            }
            if(isset($_SESSION['message'])){
                $order->message = $_SESSION['message'];
            }
            if(isset($_SESSION['leave_outside'])){
                $order->leave_outside = $_SESSION['leave_outside'];
            }
            if(isset($_SESSION['coupon_id'])){
                $couponuser = new CouponUser();
                $couponuser->user_id = auth()->user()->id;
                $couponuser->coupon_id = $_SESSION['coupon_id'];
                $couponuser->save();
                unset($_SESSION['coupon_id']);
                unset($_SESSION['coupon_code']);
            }
            $order->status = 0;
            $order->delivery_address_id = $delivery->id;
            $order->delivery_time_id = $deliverytime->id;
            $order->total_price = $klarna_order_confirmation->order_amount/100;
            $order->save();
            
            foreach($_SESSION['cart'] as $product_id => $qty) {
                
                $order_details = new OrderDetail();
                $order_details->order_id = $klarna_order_confirmation->order_id;
                $order_details->product_id  = $product_id;
                $order_details->qty = $qty;
                $order_details->save();
            };
            
            if(auth()->check()){
                Mail::to(auth()->user()->email)->send(new ConfirmationEmail($order));
            }else{
                Mail::to($order->getdeliveryaddress->email)->send(new ConfirmationEmail($order));
            }
            
            Mail::to('hr@softwarebyte.co')->send(new ConfirmationEmail($order, true));
            
            
        }
        
        unset($_SESSION['cart']);
        return view('frontend.confirmation', ['klarna_order_confirmation'=>$klarna_order_confirmation, 'categories'=>$categories]);
    }
}
