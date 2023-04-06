<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/products', [App\Http\Controllers\Frontend\Api\ProductsController::class, 'index']);

Route::get('/search/{search}', [App\Http\Controllers\Frontend\Api\ProductsController::class, 'search']);

Route::get('/cart',  [App\Http\Controllers\Frontend\Api\CartController::class, 'index']);

Route::get('/cart/session', [App\Http\Controllers\Frontend\Api\CartController::class, 'GetSession']);

Route::delete('/cart/destroy', [App\Http\Controllers\Frontend\Api\CartController::class, 'destroy']);

Route::post('/cart/{id}/{qty}', [App\Http\Controllers\Frontend\Api\CartController::class, 'store']);

Route::get('/cart/total', [App\Http\Controllers\Frontend\Api\CartController::class, 'GetTotal'])->name('cart-total');

Route::get('/cart/{id}', [App\Http\Controllers\Frontend\Api\CartController::class, 'GetQuantity']);

Route::get('/favourites', [App\Http\Controllers\Frontend\Api\FavouritesController::class, 'index']);

Route::middleware('auth:sanctum')->post('/favourites/{id}', [App\Http\Controllers\Frontend\Api\FavouritesController::class, 'store']);

Route::middleware('auth:sanctum')->delete('/favourites/{id}', [App\Http\Controllers\Frontend\Api\FavouritesController::class, 'destroy']);




// Delivery Time
Route::get('/admin/deliverytime', [App\Http\Controllers\Admin\Api\DeliveryTimeController::class, 'index'])->name('api.deliverytime.index');

Route::get('/admin/deliverytime/{date}', [App\Http\Controllers\Admin\Api\DeliveryTimeController::class, 'show'])->name('api.deliverytime.show');

Route::get('/admin/deliverytime/alldeliverytimes', [App\Http\Controllers\Admin\Api\DeliveryTimeController::class, 'alldeliverytimes'])->name('api.deliverytime.alldeliverytimes');



Route::post('/products/filter',[App\Http\Controllers\Frontend\Api\ProductsController::class, 'filter'])->name('api.products.filter');

Route::get('/home',[App\Http\Controllers\Frontend\Api\HomeController::class, 'index'])->name('api.home');
Route::get('/category/{category_id}', [App\Http\Controllers\Frontend\Api\CategoryController::class, 'index'])->name('api.category');
Route::get('/sub_category/{sub_category_id}', [App\Http\Controllers\Frontend\Api\CategoryController::class, 'sub'])->name('api.sub_category');
Route::get('/subsub_category/{subsub_category_id}', [App\Http\Controllers\Frontend\Api\CategoryController::class, 'subsub'])->name('api.subsub_category');
Route::get('/search', [App\Http\Controllers\Frontend\Api\SearchController::class, 'index'])->name('api.search');
Route::get('/offer', [App\Http\Controllers\Frontend\Api\OfferController::class, 'index'])->name('api.offer');
