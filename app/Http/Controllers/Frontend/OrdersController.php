<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Coupon;
use App\Models\CouponUser;
use App\Models\Category;
class OrdersController extends Controller
{
    public function index(){
        $categories = Category::get();
        return view('frontend.orders', get_defined_vars());
    }
    
    public function recurring_delivery(Request $request){
        if(session_status() === PHP_SESSION_NONE) session_start();
        $_SESSION['recurring_delivery'] = $request->cycle;
        $response = Http::withHeaders(['Authorization' => "Basic UEs3MDY1M19mNzQyMTYzOGVlNWM6ck5JQnpSUjlFOGI4TDlzSg==", "Content-Type" => "application/json" ])->post('https://api.playground.klarna.com/checkout/v3/orders/'.$request->order_id);
        $klarna_order_confirmation = json_decode($response->body());
    }
    public function remove_recurring_delivery(){
        if(session_status() === PHP_SESSION_NONE) session_start();
        if(isset($_SESSION['recurring_delivery'])){
            
        unset($_SESSION['recurring_delivery']);
        }
    }
    
    public function message(Request $request){
        if(session_status() === PHP_SESSION_NONE) session_start();
        $_SESSION['message'] = $request->message;
    }
    public function remove_message(){
        if(session_status() === PHP_SESSION_NONE) session_start();
        if(isset($_SESSION['message'])){
            unset($_SESSION['message']);
        }
    }
    
    public function leave_outside(){
        if(session_status() === PHP_SESSION_NONE) session_start();
        $_SESSION['leave_outside'] = true;
    }
    public function remove_leave_outside(){
        if(session_status() === PHP_SESSION_NONE) session_start();
        if(isset($_SESSION['leave_outside'])){
            unset($_SESSION['leave_outside']);
        }
    }
    
    
    public function coupon(Request $request){
        if(session_status() === PHP_SESSION_NONE) session_start();
        $date = date("Y-m-d");
        $coupon = Coupon::where('code', $request->code)->where('start_date', '<=' , $date)->where('end_date', '>=', $date)->first();
        if($coupon){
            
        $_SESSION['coupon_code'] = $request->code;
        $_SESSION['coupon_id'] = $coupon->id;
        return $coupon;
        }
        return 404;
    }
    public function remove_coupon(){
        if(session_status() === PHP_SESSION_NONE) session_start();
        if(isset($_SESSION['coupon_code'])){
            unset($_SESSION['coupon_code']);
            unset($_SESSION['coupon_id']);
        }
    }
}
