<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Coupon;

class BonusAndCreditController extends Controller
{
    public function index(){
        $categories = Category::get();
        $coupons = Coupon::get();
        return view('frontend.bonus-and-credits', get_defined_vars());
    }
}

