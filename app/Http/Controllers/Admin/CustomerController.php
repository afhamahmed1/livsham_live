<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Orders;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    public function index()
    {
        
      $list = User::where('role', '1')->with('getorders')->latest()->get();
        // $users = User::select('id','email','name','status')->latest()->paginate(5);
    
        return view('backend.admin.customers.index',get_defined_vars());
    }
    public function order_history($user_id)
    {
         $list = Orders::where('user_id', $user_id)->get();
        return view('backend.admin.user_order_history.index',get_defined_vars());
    }
}
