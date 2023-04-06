@extends('frontend.master')


@section('content')

@if (count($sub_cat)>0)
<div class="max-w-7xl mx-auto p-4">
    <div class="flex" aria-label="Breadcrumb">
        <ol class="inline-flex flex-wrap items-center space-x-1 md:space-x-3">
          <li class="inline-flex items-center">
            <a href="/" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
              <svg aria-hidden="true" class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
              Hem
            </a>
          </li>
          <li aria-current="page">
            <div class="flex items-center">
              <svg aria-hidden="true" class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
              <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">{{ $category[0]->name }}</span>
            </div>
          </li>
        </ol>
      </div>
   
</div>
<div class="fixed-product-bg bg-black fixed h-[100vh] top-0 left-0 right-0 opacity-70 z-40 hidden" id="product_bg">
</div>
    <div class="fixed-product fixed h-[100vh] top-0 left-0 right-0 z-50 hidden" id="openProduct" >
      <div class="w-full h-full flex justify-between items-center z-20 md:px-10">
        <div class="hidden w-16 h-16 md:flex justify-center items-center bg-white text-gray-400 hover:text-black rounded-full" id="pre_product"  onclick="preProduct('pre_product')">
          <a class="p-2" >
            <i class="fa-solid fa-arrow-left text-4xl"></i>
          </a>
        </div>
        <div class="product w-full h-[100vh] md:w-[70%] md:h-[85%] md:min-h-[700px] md:max-w-[50rem] bg-white md:rounded-lg overflow-y-scroll" id="scroll" onscroll="scrollFunction()">
          <div class="pb-16">
            <div class=" p-4 flex justify-between items-center w-full sticky top-0 py-1 bg-white " id="model-top">
              <div class=" "> 
                <div class="flex text-center justify-center items-center bg-red-500 rounded-full w-[45px] h-[45px] text-white font-semibold" id="fixed_off_price"></div>
              </div>
              <div id="demo">
              </div>
              <div class="w-6 h-6 rounded-full flex justify-center items-center text-gray-400 hover:text-black transform hover:scale-150 transition duration-500 ease-in-out" onclick="clickToClose('openProduct','product-bg')" >
                <i class="fa-solid fa-xmark mx-[6px] text-lg active:font-bold"></i>
              </div>
            </div>
            <div class="p-4">
              <div class="w-full flex justify-center" >
                  <img src="" alt="" class="w-[50%]" id="fixedProductImage">
                  
              </div>
              <div class="w-full flex justify-between items-center ">
                  <div class="text-base font-semibold text-gray-500" id="fixed_field"></div>
                  <div><img src="{{ asset('frontend/images/msc.png') }}" alt="msc" width="40px" id="fixed_field_img"></div>
              </div>
              <div>
                  <div class="whitespace-nowrap text-xl font-semibold" id="fixed_name"></div>
              </div>
              <div class="w-full flex justify-between items-center mb-10">
                  <div class="text-base font-semibold text-gray-500" id="fixed_weight">600 g</div>
                  <div class="text-base font-semibold text-gray-500" id="fixed_address">Nordostatlanten</div>
              </div>
              <div class="flex justify-between items-center my-4">
                <div class="flex flex-col items-start">
                  <div class="text-xl font-bold text-red-600" id="fixed_off_price_in"></div>
                  <div class="font-bold text-base"><s class="" id="fixed_price">145:-</s> </div>
                </div>
                <div class="flex flex-col items-end">
                  <div class="text-sm font-bold text-gray-500" id="fixed_price_perKG">165:-/kg</div>
                  <div class="text-sm font-semibold text-gray-500" id="fixed_max">Max 2 / kop</div>
                </div>
              </div>
              <p id="fixed_description">
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quia, fuga velit nam distinctio quas ipsam praesentium quibusdam fugiat libero enim quidem sunt porro qui consequatur veritatis beatae tempora nostrum possimus et fugit? Libero nulla facere fugiat sequi nisi omnis autem soluta nemo, porro iure similique impedit quis quod labore quo nobis in ratione atque? Blanditiis minima consequatur error numquam voluptatum impedit consectetur, esse vitae reprehenderit ipsa odit nisi ratione itaque alias. Commodi officia enim, ad id rerum, alias illum sed cumque quibusdam, hic dolores ipsam qui libero non numquam necessitatibus voluptatem deserunt veniam? Corrupti porro quo dolorum error, dolor ex.
              </p>
              <div class="flex w-full mb-3 z-20">
                <div class="fixed bottom-20 left-0 right-0 flex justify-center items-center">
                  <div class="border-2 border-gray-500 bg-white w-[85%] max-w-[30rem] rounded-full px-2 py-2 pl-8 shadow4">
                    <div class="flex justify-between items-center">
                      <div class="flex flex-col items-start">
                        <div class="text-base md:text-xl font-bold text-red-600" id="fixed_off_price_btn"></div>
                        <div class="font-bold text-sm md:text-base flex items-center"><span id="fixed_price_btn"></span><span class="text-[10px] sm:text-xs ml-2 text-gray-500 whitespace-nowrap">Jmf pris <span id="fixed_price_compare"></span></span> </div>
                      </div>
                      <div>
                        <a class="text-white text-lg bg-green-600 hover:bg-green-700 px-4 sm:px-12 py-2 rounded-full">Buy</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="hidden w-16 h-16 md:flex justify-center items-center bg-white text-gray-400 hover:text-black rounded-full" id="next_product" onclick="nextProduct('next_product')">
          <a class="p-2"  onclick="">
            <i class="fa-solid fa-arrow-right text-4xl"></i>
          </a>
        </div>
      </div>
</div>

<!-- -------------------page-content----------------- -->
  
    <section class="fruit-and-vegitable">
        <div class="max-w-7xl mx-auto px-3">
            <div class="row">
            

            <div class="main-heading">
                <h1> {{ $category[0]->name }}</h1>
            </div>

            <!--<div class="filter">-->
            <!--    <a data-bs-toggle="offcanvas" href="#filters" role="button" aria-controls="offcanvasExample">Filter</a>-->
            <!--</div>-->
        </div>
    </div>
    </section>



<!-- -------------------filter----------------- -->

    @include('frontend.layouts.filter')
    
    
    <section class="card-filter overflow-hidden mx-1">
        <div class=" max-w-7xl mx-auto">
            <div class="row">

                <div class="catagories col-lg-3 d-none d-lg-block" style="margin-top: 10px;">
                    @foreach ($sub_cat as $item)
                       @php
                           if (request()->category || request()->offer) {
                           $url =  route('frontend.sub_cat', ['sub_category'=>$item->id]);
                           } elseif(request()->subcategory) {
                            $url = route('frontend.subsub_cat', ['sub_sub_category'=>$item->id]) ;
                           
                           } 
                           
                       @endphp
                    <a href="{{$url}}" class="Categories-btn">{{$item->name}} <i class="bi bi-chevron-right"></i></a>
                    
                    @endforeach
                    
                </div>
                <div class="category-page-items row col-lg-9 mx-auto">
                     
                        
                </div>
                
                
            </div>
        </div>
        
    </div>
    
    
    @foreach ($product as $item)
<div class="preview-modal modal fade" id="data-{{$item->id}}" tabindex="-1" aria-labelledby="{{$item->name}}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <i class="bi bi-x" data-bs-dismiss="modal" aria-label="Close"></i>
        </div>
        <div class="modal-body">
            <div class="preview relative">
                <div class="container">
                    <div class="row" id="{{$item->id}}">
                        @csrf
                        <div class="col-lg-12 mx-auto mb-20">
                            <img src="{{ asset($item->image ? $item->image->path : 'frontend/images/no-item.png') }}" alt="{{$item->name}}">
    
                            <div class="like"> 
                                     @if(auth()->user())
                                        @if(auth()->user()->is_favourite($item->id))
                                            <i id="likebtn" class="bi bi-heart-fill likebtn" style="color: red;"></i>
                                            
                                        @else
                                        
                                            <i id="likebtn" class="bi bi-heart-fill likebtn"></i>
                                        @endif
                                    @else
                                    
                                    <i id="likebtn" class="bi bi-heart-fill likebtn"></i>
                                    @endif
                            </div>
    
                            <div class="links">
                                <i class="bi bi-house-door-fill"></i>
                                @if($item->getcategory)
                                <h4><a href="{{ route('pro_cat', ['category'=>$item->getcategory->id]) }}"> {{ $item->getcategory->name }}</a> / </h4>
                                @endif
                                @if($item->getsubcategory)
                                <h4><a href="{{ route('frontend.sub_cat', ['sub_category'=>$item->getsubcategory[0]->id]) }}"> {{ $item->getsubcategory[0]->name }}</a> / </h4>
                                @endif
                                @if($item->getsubsubcategory)
                                <h4><a href="{{ route('frontend.subsub_cat', ['sub_sub_category'=>$item->getsubsubcategory[0]->id]) }}"> {{ $item->getsubsubcategory[0]->name }}</a> </h4>
                                @endif
                                
                            </div>
    
                            <div class="product">
                                <div class="product-1">
                                    <h1>{{ $item->name }}</h1>
                                    <p>{{ $item->weight }}</p>
                                </div>
    
                                    @if($item->getcategory)
                                <!--<div class="product-button">-->
                                <!--    <a href="#" class="product-btn">{{ $item->getcategory->name }}</a>-->
                                <!--</div>-->
                                    @endif
                            </div>
                            @if(strlen(filter_var($item->product_information, FILTER_SANITIZE_STRING)))
                            <h3> <strong> Produktinformation</strong></h3>
                            <br>
                            <p>{!! $item->product_information !!}</p>
                            <br>
                            @endif
                            
                            <!--{{ ($item->origin) }}-->
                            @if($item->origin_id)
                            <div class="product-country">
                                <i class="bi bi-globe"></i>
    
                                <div class="country-info">
                                    <p>Ursprung:- {{ $item->getorigin->name }}</p>
                                </div>
                            </div>
                             @endif
                             <br>
                            <div class="product-discription">
                                
                                @if(strlen(filter_var($item->nutritional_content, FILTER_SANITIZE_STRING)))
                                <h3> <strong> Näringsinnehåll</strong></h3>
                                <br>
                                
                                <p>{!! $item->nutritional_content !!}</p>
                                <br>
                                @endif
                                @if(strlen(filter_var($item->storage, FILTER_SANITIZE_STRING)))
                                <h3> <strong>Lagring</strong></h3>
                                <br>
                                <p>{{ $item->storage }}</p>
                                <br>
                                @endif
                                @if(strlen(filter_var($item->other_information, FILTER_SANITIZE_STRING)))
                                <h3> <strong>Använda sig av</strong></h3>
                                <br>
                                <p>{!! $item->other_information !!}</p>
                                <br>
                                @endif
                      
                            </div>
    
                        </div>
                    </div>
                    
                    <div class="buy-now sticky w-100" id="{{ $item->id}}">
                                <div class="buy-content">
                                    <span>
                                        <h4 class="discount-price ">{{$item->discount_price > 0 ? $item->discount_price : $item->price }}:-</h4>
                                        <p> <span class="line-through  {{$item->discount_price <= 0 ? 'hidden' : '' }}"> {!! $item->discount_price <= 0 ? $item->price : '<s>'.$item->price.'</s>' !!}</span> <span>Jmf pris {{$item->compare_price}}:-</span></p>
                                    </span>
    
                                    <div class="card-counter d-flex">
                                        <a><i class="bi bi-dash-circle-fill minus"></i></a>
                                        <input type="number" class="st" value="0" size="2">
                                        <a><i class="bi bi-plus-circle-fill plus"></i></a>
    
                                        <button class="first-btn">
                                            Köp
                                        </button>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
        </div>
        
      </div>
    </div>
</div>
 @endforeach
 

@else

<!-- component -->
<main class="h-screen w-full flex flex-col justify-center items-center bg-[#1A2238]">
	<h1 class="text-9xl font-extrabold text-white tracking-widest"><img src="{{ asset('frontend/images/logo.png') }}" alt=""></h1>
	<div class="bg-green-600 px-2 text-lg rounded rotate-12 absolute">
		Product Not Found
	</div>
	<button class="mt-5">
      <a href="{{ route('index') }}"
        class="relative inline-block text-sm font-medium text-green-600 group active:text-green-700 focus:outline-none focus:ring"
      >
        <span
          class="absolute inset-0 transition-transform translate-x-0.5 translate-y-0.5 bg-green-600 group-hover:translate-y-0 group-hover:translate-x-0"
        ></span>

        <span class="relative block px-8 py-3 bg-[#1A2238] border border-current">
          <span >Gå hem</span>
        </span>
      </a>
    </button>
</main>
    
@endif


@endsection