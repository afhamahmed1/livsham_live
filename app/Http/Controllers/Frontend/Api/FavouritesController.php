<?php

namespace App\Http\Controllers\Frontend\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Models\Favourites;

class FavouritesController extends Controller
{
    public function index(){
        $favourite_products = User::find(1)->favourite_products()->get();
        $favourite_products = Auth::user()->favourite_products()->get();
        return response()->json($favourite_products);
    }
    
    public function store(Request $request){
        $product_id = $request->id;
        $user_id = $request->user()->id;
        // return $user_id;
        $favourites = new Favourites;
        $favourites->user_id = $user_id;
        $favourites->product_id = $product_id;
        $favourites->save();
        return response()->json(200);
    }
    public function destroy(Request $request){
        $product_id = $request->id;
        $user_id = $request->user()->id;
        Favourites::where('user_id', $user_id)->where('product_id',$product_id)->delete();
        return response()->json(200);
    }
    
}
