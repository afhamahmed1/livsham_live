<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Orders;
use App\Models\OrderList;
use App\Models\User;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderCancelEmail;
use App\Mail\OrderDeliveredEmail;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      
          $list = Orders::get();
        return view('backend.admin.orders.index',get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user = User::where("role",'1')->get();
        $product = Product::get();
        return view('backend.admin.orders.create',get_defined_vars());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request , Orders $orders)
    {
        
        $request->validate([
            'user_id'                 =>'required',
            'product_id'          =>'required',
            'status'               =>'required',
        ]);
      
        $orders_id = $orders->create($request->all());
         foreach ($request->product_id as $key => $value) {
           $orderlist = new OrderList();
           $orderlist->order_id = $orders_id->id;
           $orderlist->qty = 1;
           $orderlist->product_id = $value;
           $orderlist->save();
         }
    
       
        return redirect()->route('admin.order.index')->with('message',"Data Added Successfully!");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function edit(Orders $orders)
    {
        return view('backend.admin.orders.show',get_defined_vars());
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function show(Orders $orders)
    {
        // return $orders->getorder['id'];
        $user = User::where("role",'1')->get();
        $product = Product::get();
        return view('backend.admin.orders.edit',get_defined_vars());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Orders $orders)
    {
        $request->validate([
            'status'        =>'required',
        ]);
        if($request->status == 1){
            Mail::to($request->email)->send(new OrderDeliveredEmail($orders));
            Mail::to('hr@softwarebyte.co')->send(new OrderDeliveredEmail($orders, true));
        }else if($request->status == 2){
            Mail::to($request->email)->send(new OrderCancelEmail($orders));
            Mail::to('hr@softwarebyte.co')->send(new OrderCancelEmail($orders, true));
            $orders->getdeliverytime->status = 1;
            $orders->save();
        }
        $orders->update($request->all());
        return redirect()->route('admin.order.index')->with('message',"Data Updated Successfully!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function destroy(Orders $orders)
    {
        $orders->delete();
        return redirect()->route('admin.order.index')->with('warning',"Data Deleted Successfully!");
    }
}
