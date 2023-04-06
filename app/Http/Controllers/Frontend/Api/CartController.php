<?php

namespace App\Http\Controllers\Frontend\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CartController extends Controller
{
    
    
    
    public function index()
    {
        if(session_status() === PHP_SESSION_NONE) session_start();
        
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
        if (empty($results)) {
            $results = array('status' => 'error', 'message' => 'No Products in Cart');
        }
        return response()->json($results);
    }
    
    public function store(Request $request)
    {
        if(session_status() === PHP_SESSION_NONE) session_start();
        
        $product_id = $request['id'];
        $qty = $request['qty'];
        $array = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        if (isset($_SESSION['cart'][$product_id])) {
            if ($qty == 0) {
                unset($_SESSION['cart'][$product_id]);
            } else {
                $_SESSION['cart'][$product_id] = $qty;
            }
        }
        
    }
    
    public function destroy()
    {
        if(session_status() === PHP_SESSION_NONE) session_start();
        unset($_SESSION['cart']);
    }
    
    public function GetQuantity(Request $request)
    {
        if(session_status() === PHP_SESSION_NONE) session_start();
        $id= $request['id'];
        $array = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        if (isset($_SESSION['cart'][$id])) {
            $qty=intval($_SESSION['cart'][$id]) + 1;
            $_SESSION['cart'][$id] = $qty;
            array_push($array, $qty);
        } else {
            $_SESSION['cart'][$id] = 1;
            array_push($array, 1);
        }
        return response()->json($array);
    }

    
    public function GetSession()
    {
        if(session_status() === PHP_SESSION_NONE) session_start();
        $array = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        foreach ($_SESSION['cart'] as $key => $value) {
            $new_array = array();
            array_push($new_array, $key);
            array_push($new_array, $value);
            array_push($array, $new_array);
        }
        return response()->json($array);
    }
    
    public function GetTotal()
    {
        if(session_status() === PHP_SESSION_NONE) session_start();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        $total = 0;
        // dd($_SESSION['cart']);
        foreach ($_SESSION['cart'] as $cartitem) {
            
            if($cartitem['discount_price'] <=0){
                $total = $total + $cartitem['qty']*preg_replace('/[^0-9.]+/', '' , str_replace(":", ".", $cartitem['price']));
            }else{
                $total = $total + $cartitem['qty']*preg_replace('/[^0-9.]+/', '' , str_replace(":", ".", $cartitem['price']));
            }
            
        }
        return response()->json($_SESSION);
    }

    
    

}
