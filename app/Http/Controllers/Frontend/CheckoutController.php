<?php

namespace App\Http\Controllers\Frontend;
use Illuminate\Support\Facades\Mail;
use App\Models\User;
use App\Models\Orders;
use App\Mail\OrderMail;
use App\Models\Coupon;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
class CheckoutController extends Controller
{
    public function index(){
        
        
        return view('frontend.checkout');
    }
    
    public function klarna_payment(){
        if(session_status() === PHP_SESSION_NONE) session_start();
        if(isset($_SESSION['cart'])){
            
            if(count($_SESSION['cart'])<=0){
                return redirect()->route('index')->with('error','Please enter items in cart before proceeding to checkout');
            }
            
        }else{
            return redirect()->route('index')->with('error','Please enter items in cart before proceeding to checkout');
        }
        if(isset($_SESSION['postcode'])){
            if(strlen($_SESSION['postcode'])<=0){
                return redirect()->route('index')->with('error','Please enter postcode before proceeding to checkout');
            }
        }else{
            return redirect()->route('index')->with('error','Please enter postcode before proceeding to checkout');
        }
        $coupon_discount = 0 ;
        if(isset($_SESSION['coupon_id'])){
            $coupon_id = $_SESSION['coupon_id'];
            
        }
        // dd($_SESSION['cart']);
        
        $jsonData = file_get_contents('https://livsham.softwarebyte.co/api/products');
        $data = json_decode($jsonData, true);
        $results = array();
        $product_details = array();
        $product_categories = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        } else {
            foreach ($_SESSION['cart'] as $key => $value) {
                foreach ($data['data'][0] as $key2 => $value2) {
                    if ($key == $value2['id']) {
                        $category = $value2['category'];
                        if (!isset($product_details[$category])) {
                            $product_details[$category] = array();
                            array_push($product_categories, $category);
                        }
                        $value2['qty'] = $_SESSION['cart'][$key];
                        array_push($product_details[$category], $value2);
                    }
                }
            }
            $results[0] = $product_categories;
            $results[1] = $product_details;
        }
        // dd($results[1]);
        
        $total = 0;
        $total_items = [];
        for($i = 0; $i < count($results[0]); $i++){
            if(!$results[1][$results[0][$i]]){
                        
                $results[1][$results[0][$i]] = [];
            }
            for ($j = 0; $j < count($results[1][$results[0][$i]]); $j++) {
                $total_item=[];
                if(floatval(preg_replace('/[^0-9.]+/','',str_replace(':','.',$results[1][$results[0][$i]][$j]["discount_price"])))> 0){
                $total_item['name']= $results[1][$results[0][$i]][$j]["name"];
                $total_item['quantity']= floatval($results[1][$results[0][$i]][$j]["qty"]);
                $total_item['unit_price']= floatval( preg_replace('/[^0-9.]+/','',str_replace(':','.',$results[1][$results[0][$i]][$j]["discount_price"])));
                $total_item['tax_rate']= 0;
                $total_item['total_amount']= floatval( preg_replace('/[^0-9.]+/','',str_replace(':','.',$results[1][$results[0][$i]][$j]["discount_price"])))*floatval($results[1][$results[0][$i]][$j]["qty"]);
                $total_item['total_discount_amount']= 0;
                $total_item['total_tax_amount']= 0;
                
                 
                 $total = $total + floatval($results[1][$results[0][$i]][$j]["qty"])*floatval( preg_replace('/[^0-9.]+/','',str_replace(':','.',$results[1][$results[0][$i]][$j]["discount_price"])));
                }else{
                    $total_item['name']= $results[1][$results[0][$i]][$j]["name"];
                $total_item['qty']= floatval($results[1][$results[0][$i]][$j]["qty"]);
                $total_item['price']= floatval( preg_replace('/[^0-9.]+/','',str_replace(':','.',$results[1][$results[0][$i]][$j]["price"])));
                    // array_push($total_item, $results[1][$results[0][$i]][$j]["name"], floatval($results[1][$results[0][$i]][$j]["qty"]),floatval( preg_replace('/[^0-9.]+/','',str_replace(':','.',$results[1][$results[0][$i]][$j]["price"]))));
                $total = $total + floatval($results[1][$results[0][$i]][$j]["qty"])*floatval( preg_replace('/[^0-9.]+/','',str_replace(':','.',$results[1][$results[0][$i]][$j]["price"])));
                }
                array_push($total_items, $total_item);
            }
        }
        
        $tax = 95;
        if($total >= 1000){
            $tax = 0;
        }
        if(isset($_SESSION['coupon_id'])){
            $coupon= Coupon::where('id',$_SESSION['coupon_id'])->first(); 
            if($coupon){
                if($coupon->type == "Percentage"){
                    $total = $total - ($total*$coupon->amount)/100;
                }else if($coupon->type =="Flat"){
                    
                    if( $coupon->amount){
                        $total = $total - $coupon->amount;
                    } else{
                        return redirect()->back()->with('error','coupon discount must be lesser than total amount');
                    }
                }else if($coupon->type == "FreeShipping"){
                    $tax = 0;
                }
            }
        }
        
        $total = ($total + $tax) * 100;
        
        
        $order_lines = [
                  "name"=> "Liveshem Products",
                  "quantity"=> 1,
                  
                  "unit_price"=> $total,
                  "tax_rate"=> 0,
                  "total_amount"=> $total,
                  "total_discount_amount"=> 0,
                  "total_tax_amount"=> 0
              ];
        
        $recurring_delivery = [];
        if(isset($_SESSION['recurring_delivery'])){
            
            $count = ($_SESSION['recurring_delivery']== 'bi_weekly') ? 2 : 4;
            $interval = "MONTH";
            $recurring_delivery = [
                    "interval"=> $interval,
                    "interval_count"=>$count
                ];
                
            // $order_lines = [
            //      "name"=> "Liveshem Products",
            //       "quantity"=> 1,
            //       "subscription" => $recurring_delivery,
            //       "unit_price"=> $total,
            //       "tax_rate"=> 0,
            //       "total_amount"=> $total,
            //       "total_discount_amount"=> 0,
            //       "total_tax_amount"=> 0
            //     ];
        }
        
        
       
        $data = [
          "purchase_country"=> "SE",
          "purchase_currency"=> "SEK",
          "locale"=> "sv-SE",
          "order_amount"=> $total,
          "order_tax_amount"=> 0,
          "order_lines"=> [
              $order_lines
            ],
          "merchant_urls"=> [
            "terms"=> "https://livsham.softwarebyte.co/Integritetspolicy",
            "checkout"=> "https://livsham.softwarebyte.co/checkout",
            "confirmation"=> "https://livsham.softwarebyte.co/confirmation/{checkout.order.id}",
            "push"=> "https://livsham.softwarebyte.co/"
          ]
        ];
        $response = Http::withHeaders(['Authorization' => "Basic UEs3MDY1M19mNzQyMTYzOGVlNWM6ck5JQnpSUjlFOGI4TDlzSg==", "Content-Type" => "application/json" ])->post('https://api.playground.klarna.com/checkout/v3/orders', $data);
        
        
    return view('frontend.klarna-payment', ['klarna_order' => json_decode($response->body())]);
    }
    public function order_email()
    {
           $user = User::where("id",auth()->user()->id)->first();
            $list = Orders::where('user_id',auth()->user()->id)->with(['getorder'=>function($query){
            $query->with('getproduct');
           }])->get();
            $list;
         
        $order = [
            'title' => 'Welcome to ItSolutionStuff.com',
            'date' => date('d M , Y'),
            'list' => $list,
            'user' => $user,
        ];
        // return new OrderMail($order);
        Mail::to(auth()->user()->email)->send(new OrderMail($order));
        return redirect()->route('index')->with('message',"Order has Been Placed Successfully! Please check your email for more information");
        // $pdf = PDF::loadView('backend.pdf', $data);
    
        // return $pdf->download('invoice.pdf');
    }
}
