<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Tag;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\SubSubCat;
use App\Models\Product;
use App\Models\ProductImage;
use Monarobase\CountryList\CountryListFacade;
use Illuminate\Http\Request;
use App\Models\ProductOrigin;
use App\Models\ProductTrademark;
use App\Models\ProductDiet;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
           return $product_category = SubCategory::where('category_id',$request->id)->get();
           return $product_sub_category = SubSubCat::where('sub_cat_id',$request->id)->get();
            // $product_weekly = Product::where('items_status', 'Weekly')->with('getcategory','image')->get();
            //   $product_popular = Product::where('items_status', 'Popular')->take($request->data + 10)->with('getcategory','image')->get();
            // $view = View::make('backend.admin.product.index',compact('product_category'));
            //  $sections = $view->renderSections(); 
            //  return $sections['content'];

        }
           $list = Product::with(['getsubcategory'=> function($query){
            // $query->where('id',5);
            $query->with('getsubsubcategory');
           }])->get();
         
         $product_origin = ProductOrigin::get();
        return view('backend.admin.product.index',get_defined_vars());
    }
    
    public function category(Request $request){
        return $product_category = SubCategory::where('category_id',$request->id)->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
     
     
    public function sub_category(Request $request){
        return $product_sub_category = SubSubCat::where('sub_cat_id',$request->id)->get();
    }
    public function create()
    {
        $category_list = Category::get();
        $sub_categories = SubCategory::get();
        $subsub_categories = SubSubCat::get();
        $tag_list = Tag::get();
        $product_origin = ProductOrigin::get();
        return view('backend.admin.product.create',get_defined_vars());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,Product $product)
    {
        // return $request;
      
        $request->validate([
            'name'                 =>'required',
            'category_id'          =>'required',
            'sub_cat_id'          =>'required',
            'subsub_cat_id'          =>'required',
            'tag_id'               =>'required',
            'origin_id'               =>'required',
            'price'                =>'required',
            'compare_price'        =>'nullable',
            'weight'               =>'required',
            'discount_price'       => 'nullable|lt:price',
        ],
        [
            'sub_cat_id.required' => 'SubCategory is Emplty please Add the Subcategory for this Category',
            'subsub_cat_id.required' => 'Sub-Sub-Category is Emplty please Add the Sub-Sub-category '
        ]);
       

        // dd($request->origin_id);
        // $pro = $product->create($request->all());
        $product->name = $request->name;
        $product->items_status = $request->items_status;
        $product->status = $request->status;
        $product->price_per_item = $request->price_per_item;
        $product->category_id = $request->category_id;
        $product->sub_cat_id = $request->sub_cat_id;
        $product->subsub_cat_id = $request->subsub_cat_id;
        $product->tag_id = $request->tag_id;
        $product->origin_id = $request->origin_id;
        $product->price = $request->price;
        $product->compare_price = $request->compare_price;
        $product->weight = $request->weight;
        $product->product_information = $request->product_information;
        $product->ingredients = $request->ingredients;
        $product->storage = $request->storage;
        $product->other_information = $request->other_information;
        $product->nutritional_content = $request->nutritional_content;
        $product->discount_price = $request->discount_price;
        $product->save();
        
        if ($request->file('image')) {
            $fileInput             = $request->file('image');
             $ext               = rand(0,99999).".". $fileInput->getClientOriginalExtension();
            $name              = $fileInput->getClientOriginalName();
            $destinationPath   = public_path('assets/images/product_image');
           
            $fileInput->move($destinationPath, $ext);
            $product_image = new ProductImage();
            $product_image->path = 'assets/images/product_image/'.$ext;
            $product_image->product_id = $product->id;
            $product_image->save();
        }
        $product_trademark = new ProductTrademark();
        $product_trademark->product_id = $product->id;
        $product_trademark->trademark_id = $request->product_trademark;
        $product_trademark->save();
        $product_diet = new ProductDiet();
        $product_diet->product_id = $product->id;
        $product_diet->diet_id = $request->product_diet;
        $product_diet->save();
        return redirect()->route('admin.product.index')->with('message',"Data Added Successfully!");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $category_list = Category::get();
        $tag_list = Tag::get();
        $product_origin = ProductOrigin::get();
        return view('backend.admin.product.edit',get_defined_vars());
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name'        =>'required',
            'price'                =>'required',
            'discount_price'               =>'nullable|lt:price',
        ]);
        $product->update($request->all());
        $product_trademark = ProductTrademark::where('product_id',$product->id)->first();
        if($product_trademark){
            
            $product_trademark->trademark_id = $request->product_trademark;
            $product_trademark->save();
        }
        
        $product_diet = ProductDiet::where('product_id',$product->id)->first();
        if($product_diet){
            
            $product_diet->diet_id = $request->diet_id;
            $product_diet->save();
        }
        if ($request->file('image')) {
            $fileInput             = $request->file('image');
             $ext               = rand(0,99999).".". $fileInput->getClientOriginalExtension();
            $name              = $fileInput->getClientOriginalName();
            $destinationPath   = public_path('assets/images/product_image');
           
            $fileInput->move($destinationPath, $ext);
            
            if(isset($ext) && ProductImage::where('product_id',$product->id)->first()){
                ProductImage::where('product_id',$product->id)
            ->update([
               'path' => 'assets/images/product_image/'.$ext,
               ]);

            }else{
                $product_image = new ProductImage();
                $product_image->path = 'assets/images/product_image/'.$ext;
                $product_image->product_id = $product->id;
                $product_image->save();
            }
            
            
        }
        return redirect()->route('admin.product.index')->with('message',"Data Updated Successfully!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()->route('admin.product.index')->with('warning',"Data Deleted Successfully!");
    }
    public function image_delete(ProductImage $proimage)
    {
    //    return $carimage;
       $proimage->delete();
       return redirect()->route('admin.product.index')->with('Success', 'Product image Deleted Successfully');
    }
}
