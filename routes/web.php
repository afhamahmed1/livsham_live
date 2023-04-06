<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Redirect;
use App\Mail\ConfirmationEmail;
use App\Http\Middleware\AdminMiddleware;
use Illuminate\Support\Facades\Mail;
use App\Models\Orders;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/




Auth::routes();
Route::get('/login', function () {
    return view('auth.login');
})->name('login')->middleware('guest');



//Frontend Routes
Route::get('/', [App\Http\Controllers\Frontend\HomeController::class, 'index'])->name('index');
Route::get('product/category', [App\Http\Controllers\Frontend\CategoryController::class, 'index'])->name('pro_cat');
Route::get('product/sub_category', [App\Http\Controllers\Frontend\CategoryController::class, 'sub_cat'])->name('frontend.sub_category');
Route::get('product/sub_cat/{sub_category}', [App\Http\Controllers\Frontend\SubCategoryController::class, 'index'])->name('frontend.sub_cat');
Route::get('product/subsub_cat/{sub_sub_category}', [App\Http\Controllers\Frontend\SubSubCategoryController::class, 'index'])->name('frontend.subsub_cat');
Route::any('/product/search',[App\Http\Controllers\Frontend\HomeController::class,'showproduct'])->name('product.search');
Route::get('/product/show',[App\Http\Controllers\Frontend\HomeController::class,'display_product'])->name('product.display');


Route::post('/deliverytime',[App\Http\Controllers\Frontend\DeliveryTimeController::class,'store'])->name('frontend.deliverytime');
Route::get('/deliverytime',[App\Http\Controllers\Frontend\DeliveryTimeController::class,'show'])->name('frontend.deliverytimeview');


Route::post('/postcode', [App\Http\Controllers\Frontend\HomeController::class,'set_post_code_session'])->name('postcode');
Route::get('/postcode', [App\Http\Controllers\Frontend\HomeController::class,'get_post_code_session']);

Route::get('/varor', [App\Http\Controllers\Frontend\VarorController::class, 'index'])->name('varor');



Route::get('/test',  [App\Http\Controllers\Frontend\TestController::class, 'index'])->name('test');


Route::get('/confirmation/{order_id}',  [App\Http\Controllers\Frontend\ConfirmationController::class, 'index'])->name('confirmation');


Route::get('/vanliga-fragor', [App\Http\Controllers\Frontend\FAQsController::class, 'index'])->name('faqs');
Route::get('/om-livesham', [App\Http\Controllers\Frontend\AboutUsController::class, 'index'])->name('aboutus');
Route::get('/kopvillkor', [App\Http\Controllers\Frontend\PurchaseTermsController::class, 'index'])->name('purchaseterms');
Route::get('/gdpr', [App\Http\Controllers\Frontend\GDPRController::class, 'index'])->name('gdpr');
Route::get('/Integritetspolicy', [App\Http\Controllers\Frontend\PrivacyPolicyController::class, 'index'])->name('privacypolicy');
Route::get('/cookiepolicy', [App\Http\Controllers\Frontend\CookiePolicyController::class, 'index'])->name('cookiepolicy');

Route::get('/extrapriser', [App\Http\Controllers\Frontend\ExtrapriserController::class, 'index'])->name('extrapriser');

Route::get("/checkout", [App\Http\Controllers\Frontend\CheckoutController::class, 'index'])->middleware('checkout')->name('checkout');
Route::get('/klarna-payment', [App\Http\Controllers\Frontend\CheckoutController::class, 'klarna_payment'])->middleware('checkout')->name('klarna-payment');
Route::post('/validate_coupon', [App\Http\Controllers\Frontend\OrdersController::class, 'coupon'])->name('validate_coupon');




Route::middleware('auth')->group(function(){

  Route::get('product/cart', [App\Http\Controllers\Frontend\CartController::class, 'cart'])->name('index_cart');
  Route::get('product/cart/{id}', [App\Http\Controllers\Frontend\CartController::class, 'store'])->name('cart');
  Route::get('product/cart/delete/{cart}', [App\Http\Controllers\Frontend\CartController::class, 'delete'])->name('delete.cart');
  Route::post('product/cart/update', [App\Http\Controllers\Frontend\CartController::class, 'update'])->name('update.cart');
  Route::get('delete/all', [App\Http\Controllers\Frontend\CartController::class, 'delete_all'])->name('delete_all.cart');
  Route::get('order/email', [App\Http\Controllers\Frontend\CheckoutController::class, 'order_email'])->name('order_email');
  // return Redirect::to(url()->previous());
  
Route::get('/favourites', [App\Http\Controllers\Frontend\FavouritesController::class, 'index'])->name('favourites');
  
   Route::get('/profile', [App\Http\Controllers\Frontend\ProfileController::class,'index'])->name('profile');
   Route::post('/add_address', [App\Http\Controllers\Frontend\ProfileController::class,'add_address'])->name('add_address');
    Route::get('/shopping-list', [App\Http\Controllers\Frontend\ShoppinglistController::class, 'index'])->name('shopping-list');
    Route::get('/recurring-deliveries', [App\Http\Controllers\Frontend\RecurringDeliveriesController::class, 'index'])->name('recurring-deliveries');
    Route::get('/orders', [App\Http\Controllers\Frontend\OrdersController::class,'index'])->name('orders');
    Route::post('/orders/recurring_delivery' , [App\Http\Controllers\Frontend\OrdersController::class,'recurring_delivery'])->name('orders.recurring_delivery');
    Route::post('/orders/message' , [App\Http\Controllers\Frontend\OrdersController::class,'message'])->name('orders.message');
    Route::post('/orders/leave_outside' , [App\Http\Controllers\Frontend\OrdersController::class,'leave_outside'])->name('orders.leave_outside');
    Route::post('/orders/recurring_delivery/remove' , [App\Http\Controllers\Frontend\OrdersController::class,'remove_recurring_delivery'])->name('orders.recurring_delivery.remove');
    Route::post('/orders/message/remove' , [App\Http\Controllers\Frontend\OrdersController::class,'remove_message'])->name('orders.message.remove');
    Route::post('/orders/leave_outside/remove' , [App\Http\Controllers\Frontend\OrdersController::class,'remove_leave_outside'])->name('orders.leave_outside.remove');
    
    Route::get('/bonus-and-credits', [App\Http\Controllers\Frontend\BonusAndCreditController::class, 'index'])->name('bonus-and-credits');
    
    
    
Route::get('api/favourites', [App\Http\Controllers\Frontend\Api\FavouritesController::class, 'index']);

Route::get('api/favourites/store/{id}', [App\Http\Controllers\Frontend\Api\FavouritesController::class, 'store']);

Route::get('api/favourites/delete/{id}', [App\Http\Controllers\Frontend\Api\FavouritesController::class, 'destroy']);

    
});

// Route::any('/register', [App\Http\Controllers\HomeController::class, 'index']);







//Backend Routes

Route::group(['middleware' => 'auth'], function () {
    
    Route::group(['middleware' => 'is_admin'], function(){
     
    Route::get('/index', [App\Http\Controllers\HomeController::class, 'index'])->name('dashboard');
    
    // Category Links 
    Route::get('/admin/category/index', [App\Http\Controllers\Admin\CategoryController::class, 'index'])->name('admin.category.index');
    Route::get('/admin/category/create', [App\Http\Controllers\Admin\CategoryController::class, 'create'])->name('admin.category.create');
    Route::post('/admin/category/store', [App\Http\Controllers\Admin\CategoryController::class, 'store'])->name('admin.category.store');
    Route::get('/admin/category/edit/{category}', [App\Http\Controllers\Admin\CategoryController::class, 'edit'])->name('admin.category.edit');
    Route::post('/admin/category/update/{category}', [App\Http\Controllers\Admin\CategoryController::class, 'update'])->name('admin.category.update');
    Route::get('/admin/category/destroy/{category}', [App\Http\Controllers\Admin\CategoryController::class, 'destroy'])->name('admin.category.destroy');

    //Ajax Links
    Route::get('/ajax/category', [App\Http\Controllers\Admin\ProductController::class, 'category'])->name('ajax.category');
    Route::get('/ajax/subcategory', [App\Http\Controllers\Admin\ProductController::class, 'sub_category'])->name('ajax.subcategory');
    //Sub-Category
    Route::get('/admin/subcategory/index', [App\Http\Controllers\Admin\SubCategoryController::class, 'index'])->name('admin.subcategory.index');
    Route::get('/admin/subcategory/create', [App\Http\Controllers\Admin\SubCategoryController::class, 'create'])->name('admin.subcategory.create');
    Route::post('/admin/subcategory/store', [App\Http\Controllers\Admin\SubCategoryController::class, 'store'])->name('admin.subcategory.store');
    Route::get('/admin/subcategory/edit/{subCategory}', [App\Http\Controllers\Admin\SubCategoryController::class, 'edit'])->name('admin.subcategory.edit');
    Route::post('/admin/subcategory/update/{subCategory}', [App\Http\Controllers\Admin\SubCategoryController::class, 'update'])->name('admin.subcategory.update');
    Route::get('/admin/subcategory/destroy/{subCategory}', [App\Http\Controllers\Admin\SubCategoryController::class, 'destroy'])->name('admin.subcategory.destroy');
    
    // Post Code 
    Route::get('/admin/postnummer/index', [App\Http\Controllers\Admin\PostcodeController::class, 'index'])->name('admin.postcode.index');
    Route::get('/admin/postnummer/create', [App\Http\Controllers\Admin\PostcodeController::class, 'create'])->name('admin.postcode.create');
    Route::post('/admin/postnummer/store', [App\Http\Controllers\Admin\PostcodeController::class, 'store'])->name('admin.postcode.store');
    Route::get('/admin/postnummer/edit/{postcode}', [App\Http\Controllers\Admin\PostcodeController::class, 'edit'])->name('admin.postcode.edit');
    Route::post('/admin/postnummer/update/{postcode}', [App\Http\Controllers\Admin\PostcodeController::class, 'update'])->name('admin.postcode.update');
    Route::get('/admin/postnummer/destroy/{postcode}', [App\Http\Controllers\Admin\PostcodeController::class, 'destroy'])->name('admin.postcode.destroy');

    //Sub-Sub-Category
    Route::get('/admin/subsubcategory/index', [App\Http\Controllers\Admin\SubSubCategoryController::class, 'index'])->name('admin.subsubcat.index');
    Route::get('/admin/subsubcategory/create', [App\Http\Controllers\Admin\SubSubCategoryController::class, 'create'])->name('admin.subsubcat.create');
    Route::post('/admin/subsubcategory/store', [App\Http\Controllers\Admin\SubSubCategoryController::class, 'store'])->name('admin.subsubcat.store');
    Route::get('/admin/subsubcategory/edit/{subsubcat}', [App\Http\Controllers\Admin\SubSubCategoryController::class, 'edit'])->name('admin.subsubcat.edit');
    Route::post('/admin/subsubcategory/update/{subsubcat}', [App\Http\Controllers\Admin\SubSubCategoryController::class, 'update'])->name('admin.subsubcat.update');
    Route::get('/admin/subsubcategory/destroy/{subsubcat}', [App\Http\Controllers\Admin\SubSubCategoryController::class, 'destroy'])->name('admin.subsubcat.destroy');


    // Tag Links
    Route::get('/admin/tag/index', [App\Http\Controllers\Admin\TagController::class, 'index'])->name('admin.tag.index');
    Route::get('/admin/tag/create', [App\Http\Controllers\Admin\TagController::class, 'create'])->name('admin.tag.create');
    Route::post('/admin/tag/store', [App\Http\Controllers\Admin\TagController::class, 'store'])->name('admin.tag.store');
    Route::get('/admin/tag/edit/{tag}', [App\Http\Controllers\Admin\TagController::class, 'edit'])->name('admin.tag.edit');
    Route::post('/admin/tag/update/{tag}', [App\Http\Controllers\Admin\TagController::class, 'update'])->name('admin.tag.update');
    Route::get('/admin/tag/destroy/{tag}', [App\Http\Controllers\Admin\TagController::class, 'destroy'])->name('admin.tag.destroy');
    
    // Messages
    Route::get('/admin/message', [App\Http\Controllers\Admin\MessageController::class, 'index'])->name('admin.message');
    Route::delete('/admin/message/destroy/{message}', [App\Http\Controllers\Admin\MessageController::class, 'destroy'])->name('admin.message.destroy');
    Route::post('/admin/message/store', [App\Http\Controllers\Admin\MessageController::class, 'store'])->name('admin.message.store');
    
    Route::get('/admin/productorigin/index', [App\Http\Controllers\Admin\ProductOriginController::class, 'index'])->name('admin.productorigin.index');
    Route::get('/admin/productorigin/create', [App\Http\Controllers\Admin\ProductOriginController::class, 'create'])->name('admin.productorigin.create');
    Route::post('/admin/productorigin/store', [App\Http\Controllers\Admin\ProductOriginController::class, 'store'])->name('admin.productorigin.store');
    Route::get('/admin/productorigin/edit/{productorigin}', [App\Http\Controllers\Admin\ProductOriginController::class, 'edit'])->name('admin.productorigin.edit');
    Route::post('/admin/productorigin/update/{productorigin}', [App\Http\Controllers\Admin\ProductOriginController::class, 'update'])->name('admin.productorigin.update');
    Route::get('/admin/productorigin/destroy/{productorigin}', [App\Http\Controllers\Admin\ProductOriginController::class, 'destroy'])->name('admin.productorigin.destroy');
    
    Route::get('/admin/deliverytime', [App\Http\Controllers\Admin\DeliveryTimeController::class, 'index'])->name('admin.deliverytime.index');
    Route::post('/admin/deliverytime/store', [App\Http\Controllers\Admin\DeliveryTimeController::class, 'store'])->name('admin.deliverytime.store');
    Route::get('/admin/deliverytime/{date}', [App\Http\Controllers\Admin\DeliveryTimeController::class, 'show'])->name('admin.deliverytime.show');
    
    Route::get('/admin/trademarks/index', [App\Http\Controllers\Admin\TrademarksController::class, 'index'])->name('admin.trademark.index');
    Route::get('/admin/trademarks/create', [App\Http\Controllers\Admin\TrademarksController::class, 'create'])->name('admin.trademark.create');
    Route::post('/admin/trademarks/store', [App\Http\Controllers\Admin\TrademarksController::class, 'store'])->name('admin.trademark.store');
    Route::get('/admin/trademarks/edit/{trademark}', [App\Http\Controllers\Admin\TrademarksController::class, 'edit'])->name('admin.trademark.edit');
    Route::post('/admin/trademarks/update/{trademark}', [App\Http\Controllers\Admin\TrademarksController::class, 'update'])->name('admin.trademark.update');
    Route::get('/admin/trademarks/destroy/{trademark}', [App\Http\Controllers\Admin\TrademarksController::class, 'destroy'])->name('admin.trademark.destroy');
    
    
    Route::get('/admin/diets/index', [App\Http\Controllers\Admin\DietsController::class, 'index'])->name('admin.diet.index');
    Route::get('/admin/diets/create', [App\Http\Controllers\Admin\DietsController::class, 'create'])->name('admin.diet.create');
    Route::post('/admin/diets/store', [App\Http\Controllers\Admin\DietsController::class, 'store'])->name('admin.diet.store');
    Route::get('/admin/diets/edit/{diet}', [App\Http\Controllers\Admin\DietsController::class, 'edit'])->name('admin.diet.edit');
    Route::post('/admin/diets/update/{diet}', [App\Http\Controllers\Admin\DietsController::class, 'update'])->name('admin.diet.update');
    Route::get('/admin/diets/destroy/{diet}', [App\Http\Controllers\Admin\DietsController::class, 'destroy'])->name('admin.diet.destroy');
     
    // Review Links
    Route::get('/admin/review/index', [App\Http\Controllers\Admin\ReviewController::class, 'index'])->name('admin.review.index');
    Route::get('/admin/review/destroy/{review}', [App\Http\Controllers\Admin\ReviewController::class, 'destroy'])->name('admin.review.destroy');
     
    // Tag Links
    Route::get('/admin/product/index', [App\Http\Controllers\Admin\ProductController::class, 'index'])->name('admin.product.index');
    Route::get('/admin/product/create', [App\Http\Controllers\Admin\ProductController::class, 'create'])->name('admin.product.create');
    Route::post('/admin/product/store', [App\Http\Controllers\Admin\ProductController::class, 'store'])->name('admin.product.store');
    Route::get('/admin/product/edit/{product}', [App\Http\Controllers\Admin\ProductController::class, 'edit'])->name('admin.product.edit');
    Route::post('/admin/product/update/{product}', [App\Http\Controllers\Admin\ProductController::class, 'update'])->name('admin.product.update');
    Route::get('/admin/product/destroy/{product}', [App\Http\Controllers\Admin\ProductController::class, 'destroy'])->name('admin.product.destroy');


      // Coupons Links
      Route::get('/admin/coupon/index', [App\Http\Controllers\Admin\CouponController::class, 'index'])->name('admin.coupons.index');
      Route::get('/admin/coupon/create', [App\Http\Controllers\Admin\CouponController::class, 'create'])->name('admin.coupons.create');
      Route::post('/admin/coupon/store', [App\Http\Controllers\Admin\CouponController::class, 'store'])->name('admin.coupons.store');
      Route::get('/admin/coupon/edit/{coupon}', [App\Http\Controllers\Admin\CouponController::class, 'edit'])->name('admin.coupons.edit');
      Route::post('/admin/coupon/update/{coupon}', [App\Http\Controllers\Admin\CouponController::class, 'update'])->name('admin.coupons.update');
      Route::get('/admin/coupon/destroy/{coupon}', [App\Http\Controllers\Admin\CouponController::class, 'destroy'])->name('admin.coupons.destroy');



      // Orders Links
      Route::get('/admin/order/index', [App\Http\Controllers\Admin\OrderController::class, 'index'])->name('admin.order.index');
      Route::get('/admin/order/create', [App\Http\Controllers\Admin\OrderController::class, 'create'])->name('admin.order.create');
      Route::post('/admin/order/store', [App\Http\Controllers\Admin\OrderController::class, 'store'])->name('admin.order.store');
      Route::get('/admin/order/edit/{orders}', [App\Http\Controllers\Admin\OrderController::class, 'edit'])->name('admin.order.edit');
      Route::post('/admin/order/update/{orders}', [App\Http\Controllers\Admin\OrderController::class, 'update'])->name('admin.order.update');
      Route::get('/admin/order/destroy/{orders}', [App\Http\Controllers\Admin\OrderController::class, 'destroy'])->name('admin.order.destroy');


      //Coustomer links
      Route::get('/admin/customer/index', [App\Http\Controllers\Admin\CustomerController::class, 'index'])->name('admin.cust.index');
      //Order History
      Route::get('/admin/order-history/{user_id}', [App\Http\Controllers\Admin\CustomerController::class, 'order_history'])->name('admin.order_his.index');
    // Profile Update Links 
    Route::get('admin/profile', [App\Http\Controllers\Admin\ProfileController::class, 'index'])->name('admin.profile.index');
    Route::get('send-mail',[App\Http\Controllers\Admin\EmailController::class, 'mail'] );
    Route::get('generate-pdf/{orders}', [App\Http\Controllers\Admin\PDFController::class, 'generatePDF'])->name('pdf');
    Route::post('admin/profile/update', [App\Http\Controllers\Admin\ProfileController::class, 'update'])->name('admin.profile.update');
    //product image Delete
    Route::get('image/{proimage}', [App\Http\Controllers\ProductController::class, 'image_delete'])->name('image.delete');
});

   
});




