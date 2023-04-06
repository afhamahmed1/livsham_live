@extends('backend.admin.master')
@section('css')
<link rel="stylesheet" type="text/css"
    href="{{ asset('app-assets/css/plugins/forms/validation/form-validation.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('css/pages/authentication.css')}}">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/forms/select/select2.min.css') }}">
@endsection
@section('content')
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-12 mb-2 mt-1">
                <div class="breadcrumbs-top">
                    <h5 class="content-header-title float-left pr-1 mb-0">Product</h5>
                    <div class="breadcrumb-wrapper d-none d-sm-block">
                        <ol class="breadcrumb p-0 mb-0 pl-1">
                            <li class="breadcrumb-item"><a href="/"><i class="bx bx-home-alt"></i></a>
                            </li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.product.index') }}">Product List</a>
                            </li>
                            <li class="breadcrumb-item active">Product Create
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            <!-- Simple Validation start -->
            <section class="users-edit">
                <div class="card">
                    <div class="card-body">
                        @if (count($errors) > 0)
                        <div class="alert alert-danger">
                            {{ __('There were some problems with your input.') }} <br><br>
                            <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                            </ul>
                        </div>
                        @endif
                        <!-- users edit media object ends -->
                        <!-- users edit account form start -->
                        <form class="form-validate" action="{{ route('admin.product.store') }}" method="POST" id="product_form" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>name</label>
                                            <input type="text" class="form-control  @error('name') is-invalid @enderror"  placeholder="Enter Name"  name="name" value="{{old('name')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Storage</label>
                                            <input type="text" class="form-control  @error('storage') is-invalid @enderror"  placeholder="Enter Storage"  name="storage" value="{{old('storage')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>category</label>
                                            <select id="category_id"  class="form-control @error('category_id') is-invalid @enderror" name="category_id" onchange="category()">
                                                @foreach ($category_list as $item)
                                                <option value="{{$item->id}}" @if ($item->id ==   old('category_id')) selected @endif> {{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Sub-category</label>
                                            <select id="sub_cat_id"  class="form-control @error('sub_cat_id') is-invalid @enderror" name="sub_cat_id" onchange="sub_cat()">
                                                @foreach (\App\Models\SubCategory::get() as $item)
                                                <option value="{{$item->id}}" @if ($item->id ==   old('sub_cat_id')) selected @endif> {{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Sub-Sub-category</label>
                                            <select id="subsub_cat_id"  class="form-control @error('subsub_cat_id') is-invalid @enderror" name="subsub_cat_id">
                                                @foreach (\App\Models\SubSubCat::get() as $item)
                                                <option value="{{$item->id}}" @if ($item->id ==   old('subsub_cat_id')) selected @endif> {{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>tag</label>
                                            <select id="tag_id"  class="form-control @error('tag_id') is-invalid @enderror" name="tag_id">
                                                @foreach ($tag_list as $item)
                                                <option value="{{$item->id}}" @if ($item->id ==   old('tag_id')) selected @endif> {{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <h6>Product Trademarks</h6>
                                    <fieldset class="form-group">
                                        <select class="form-control select2 @error('product_trademark') is-invalid @enderror" id="product_trademark" multiple="multiple" name="product_trademark">
                                            @foreach (\App\Models\Trademark::get() as $item)
                                            
                                            <option value="{{$item->id}}" @if ($item->id ==   old('product_trademark')) selected  @endif>{{$item->name}}</option>
                                            
                                            @endforeach
                                        </select>
                                    </fieldset>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Product Diets</label>
                                            <select id="product_diet"  class="form-control select2 @error('product_diet') is-invalid @enderror" name="product_diet"  multiple="multiple">
                                                @foreach (\App\Models\Diet::get() as $item)
                                                <option value="{{$item->id}}" @if ($item->id ==   old('product_diet')) selected @endif> {{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Product Information</label>
                                            <div id="editor"></div>
                                            <textarea name="product_information" hidden id="product_information"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Origin</label>
                                            <select id="origin_id"  class="form-control @error('origin_id') is-invalid @enderror" name="origin_id">
                                                @foreach ($product_origin as $item)
                                                <option value="{{$item->id}}" @if ($item->id ==   old('origin_id')) selected @endif> {{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Ingredients</label>
                                            <input type="text" class="form-control  @error('ingredients') is-invalid @enderror"  placeholder="Enter Ingredients"  name="ingredients" value="{{old('ingredients')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Nutritional Content</label>
                                            <div id="editor1"></div>
                                            <textarea name="nutritional_content" hidden id="nutritional_content"></textarea>
                                        </div>
                                    </div>
                                </div>
                              
                                <div class="col-12 col-sm-12">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Other information</label>
                                            <div id="editor2"></div>
                                            <textarea name="other_information" hidden id="other_information"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Price</label>
                                            <input type="text" class="form-control  @error('price') is-invalid @enderror"  placeholder="Enter Price"  name="price" value="{{old('price')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Price Per Item</label>
                                            <input type="text" class="form-control  @error('price_per_item') is-invalid @enderror"  placeholder="Enter price per item"  name="price_per_item" value="{{old('price_per_item')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Compare Price</label>
                                            <input type="text" class="form-control  @error('compare_price') is-invalid @enderror"  placeholder="Enter Compare Price"  name="compare_price" value="{{old('compare_price')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Discount Price</label>
                                            <input type="text" class="form-control  @error('discount_price') is-invalid @enderror"  placeholder="Enter Discount Price"  name="discount_price" value="{{old('discount_price')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Weight</label>
                                            <input type="text" class="form-control  @error('weight') is-invalid @enderror"  placeholder="Enter Weight of Product"  name="weight" value="{{old('weight')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Upload Product Image</label>
                                            <input class="form-control " type="file" multiple name="image" value="{{old('image')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Status</label>
                                            <select id="status"  class="form-control @error('status') is-invalid @enderror" name="status">
                                                <option value="In Stock" @if (old('status') =="In Stock") selected @endif>In Stock</option>
                                                <option value="Out Of Stock " @if (old('status') =="Out Of Stock ") selected @endif>Out Of Stock </option>
                                                
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="controls">
                                            <label>Items Type</label>
                                            <select id="items_status"  class="form-control @error('items_status') is-invalid @enderror" name="items_status">
                                                <option value="Weekly" @if (old('items_status') =="Weekly") selected @endif>extrapriser</option>
                                                <option value="Popular " @if (old('items_status') =="Popular ") selected @endif>Varor som passar mig </option>
                                                <option value="Feature " @if (old('items_status') =="Feature ") selected @endif>Feature </option>
                                                
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between w-100">
                                    <button type="submit" id="submit" class="btn btn-primary glow ">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <!-- Input Validation end -->

        </div>
    </div>
</div>
<script>
    function category(){
        var product_category = document.getElementById('category_id').value ;
        // alert(product_category);
          $.ajax({
              type: "get",
              url: "{{ route('ajax.category') }}",
              data: {
                id:product_category
              },
              success: function (data) {
                  console.log(data);
                let cat =  "";
               data.forEach(element => {
                cat += '<option value='+ element.id +' > '+ element.name +'</option>';
                
               });
               var a = document.getElementById('sub_cat_id').innerHTML = cat;
            //    console.log(a);
              },
              error: function (data) {
                  console.log(data);
              }
          });
      
    
    }
    function sub_cat(){
        var product_sub_category = document.getElementById('sub_cat_id').value ;
        // alert(product_category);
          $.ajax({
              type: "get",
              url: "{{ route('ajax.subcategory') }}",
              data: {
                id:product_sub_category
              },
              success: function (data) {
                  console.log(data);
                let cat =  "";
               data.forEach(element => {
                cat += '<option value='+ element.id +' > '+ element.name +'</option>';
                
               });
               var a = document.getElementById('subsub_cat_id').innerHTML = cat;
            //    console.log(a);
              },
              error: function (data) {
                  console.log(data);
              }
          });
    }
    
    const sub_cat_id = document.getElementById('sub_cat_id')
    
    if(sub_cat_id){
        sub_cat_id.addEventListener('select', function(){
            sub_cat()
            category()
        })
    }
    const category_id = document.getElementById('category_id')
    if(category_id){
        category_id.addEventListener('select', function(){
            category()
            sub_cat()
            
        })
    }
    
    
</script>
@endsection
@section('js')
<!-- BEGIN: Page Vendor JS-->
<script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js') }}"></script>
<script src="{{ asset('app-assets/vendors/js/forms/validation/jquery.validate.min.js') }}"></script>
<!-- END: Page Vendor JS-->
<!-- BEGIN: Page JS-->
<script src="{{ asset('app-assets/js/scripts/forms/validation/form-validation.js') }}"></script>
<!-- END: Page JS-->

  
  <!-- Include the Quill library -->
  <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
  
  <!-- Initialize Quill editor -->
  <script>
    var quill = new Quill('#editor', {
      theme: 'snow'
    });
    $("#product_form").on("submit",function() {
  $("#product_information").val($("#editor").html());
})
  </script>
  <script>
    var quill = new Quill('#editor1', {
      theme: 'snow'
    });
    $("#product_form").on("submit",function() {
  $("#nutritional_content").val($("#editor1").html());
})
  </script>
  <script>
    var quill = new Quill('#editor2', {
      theme: 'snow'
    });
    $("#product_form").on("submit",function() {
  $("#other_information").val($("#editor2").html());
})
  </script>
  
   <script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js') }}"></script>
   <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js') }}"></script>
@endsection
