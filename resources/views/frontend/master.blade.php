@php
        if(session_status() === PHP_SESSION_NONE) session_start();
@endphp
<!DOCTYPE html>
<html lang="sv" xml:lang="sv">
@include('frontend.layouts.head')
<style>
    *{
       font-family: 'livshem-font';
    }
    .swiper-slide label{
        width: 100%;
    }
    .select-day-card{height: 8rem;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<body class="" id="body">
  @php
     if(Auth::check()){

       $cart = \App\Models\Cart::where('user_id', Auth::user()->id)->with('getproduct')->get();
     }else{
      $cart = [];
     }

  @endphp
  
  
    <div class="side-cart offcanvas offcanvas-end" tabindex="-1" id="cart"
        aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
            
                <h5 id="offcanvasRightLabel" class=" side-cart-heading ">Varukorg</h5>
                <i class="bi bi-x-lg" data-bs-dismiss="offcanvas" aria-label="Close"></i>
            
            
        </div>
        <div class="offcanvas-body">

             <div class="side-cart-links">
                    
                    <h3 id="post-number-btn" data-bs-toggle="modal" data-bs-target="#input-code">Postnummer, </h3>
                    <h3 id="reserve-time-btn" class="hidden" data-bs-toggle="modal" data-bs-target="#select-date-time" >Reservera tid</h3>
                </div>
            <div class="cart-progress-bar">
                <span>
                    <h3 id="p_message"></h3>
                    <!--<i class="bi bi-exclamation-circle"></i>-->
                </span>
    
                <div class="progress">
                    <div class="progress-bar" id="p-bar" role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0"
                        aria-valuemax="100"></div>
                </div>
                <p id="p_message2">då slipper du avgiften på 95 kr för en liten varukorg</p>
            </div>


            <div class="cart-products" id="cart-product">
                <h2 class="ms-3" id="message"></h2>
            </div>

            <div class="empty">
               <button class="empty-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Töm varukorg</button>
            </div>


            <div class="side-cart-price">
                <div class="side-cart-discount hidden">
                    <p>Rabatt</p>
                    <p id="cart-discount"></p>
                </div>

                <div class="side-cart-total">
                    <h2>Totalt (<span id="cart-items-count">0</span> varor)</h2>
                    <h2 id="total"></h2>
                </div>
                <h2 style="display:none" id="delivery"></h2>
                <h2 style="display:none" id="grand_total"></h2>

                <a href="{{ route('checkout') }}" id="checkout" class="cheakout-btn">Gå till kassan</a>
                
            </div>


        </div>
    </div>
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Starta en ny varukorg?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                   Vill du verkligen starta en ny varukorg?
                </div>
                <div class="modal-footer justify-center">
                    <button type="button" class="btn modal-btn-3" data-bs-dismiss="modal">Nej</button>
                    <button type="button"  onclick="EmptyCart()" id="empty-basket" class="btn modal-btn-4">Ja</button>
                </div>
            </div>
        </div>
    </div>
 

  @include('frontend.layouts.header')
  
  <div id="content_section">
    @yield('content')
  </div>
  <div id="search-preview-cards"></div>
  <div id="cart-preview-cards"></div>
  @include('frontend.layouts.footer')


<div class="select-day-modal modal fade" id="select-date-time" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <form action="{{ route('frontend.deliverytime') }}" id="delivery-time" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
    
                        <i class="bi bi-x-lg" type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></i>
                    </div>
    
                    <div class="modal-body">
    
                        <div class="heading">
                            <!--<h3>Välj leveranstid</h3>-->
                            <!--<p>Postnummer: 123 45 <span data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"-->
                            <!--        aria-controls="offcanvasRight"> Byt adress</span></p>-->
                        </div>
    
    
                            <section>
                                <div class="swiper mySwiper">
                                    
                                        <ul class="nav nav-pills mb-3 flex-nowrap swiper-wrapper" id="pills-tabs" role="tablist">
                                        
                                        </ul>
                                  </div>
                            </section>
    
    
                        <div class="tab-content" id="pills-tabContent">
    
                        </div>
    
                    </div>
    
    
                    <div class="modal-footer">
                        <button  type="submit" >Gå vidare</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <div class="post-code modal fade" id="input-code" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <i class="bi bi-x-lg" type="button" class="btn-close" data-bs-dismiss="modal"></i>
            </div>
            <form action="{{ route('postcode') }}" method ="POST">
                @csrf
            <div class="modal-body">
    
                <h1>Ange ditt postnummer</h1>
                
                <p>Fyll i ditt postnummer för att se dina alternativ för hemleverans och avhämtning i butik samt
                    rätt sortiment och erbjudanden.</p>
                
                    <div id="otp" onSubmit="onSubmit(event)" class="inputs d-flex flex-row justify-content-center mt-2"> 
                        <input class="m-1 text-center form-control rounded code-input" name="postcode_1" type="number" id="first" maxlength="1" required /> 
                        <input class="m-1 text-center form-control rounded code-input" name="postcode_2" type="number" id="second" maxlength="1" required /> 
                        <input class="m-1 text-center form-control rounded code-input" name="postcode_3" type="number" id="third" maxlength="1" required /> 
                        <input class="m-1 text-center form-control rounded code-input" name="postcode_4" type="number" id="fourth" maxlength="1" required /> 
                        <input class="m-1 text-center form-control rounded code-input" name="postcode_5" type="number" id="fifth" maxlength="1" required /> 
                    </div>
            </div>
            <div class="modal-footer">
                <!--<p><a href="login.html">Logga in</a> eller <a href="login.html">Skapa inloggning</a></p>-->
                <p><button type="submit" value="Save">Save</button></p>
            </div>
            </form>
        </div>
    </div>
    </div>
  
<!-- fixed bottom -->
<div class="z-20 flex justify-center lg:justify-end w-full fixed bottom-20 lg:bottom-4 lg:right-4">
    <button class="bg-green-300 rounded-full w-8 h-8 shadow-sm shadow-black"><a href="#body"><i class="fa-solid fa-chevron-up"></i></a></button>
</div>
<div class="z-20 flex items-center fixed bottom-20 right-3 px-6 py-2 bg-green-600 hover:bg-green-800 rounded-md text-white lg:left-4 lg:right-auto lg:bottom-4 shadow-sm shadow-green-700 whitespace-nowrap cursor-pointer" id="ChatBtn" onclick="openChat()">
    <i class="fa-solid fa-message mr-2"></i>
    <p class="text-sm">Chatt</p>
</div>

<form action="{{ route('admin.message.store') }}" method="POST" class="flex flex-col max-w-xs fixed bottom-0 right-3 rounded-t-lg lg:left-2 lg:right-auto shadow-sm shadow-black overflow-hidden z-30 hidden" id="ChatBox">
  <div class="bg-[#007033] py-2 px-4 text-lg font-bold text-white flex justify-between">
    <h1>Chatt</h1>
    @csrf
    <div class="space-x-3">
      <i class="fa solid fa-xmark cursor-pointer" onclick="closeChat()"></i>
    </div>
  </div>
  <div class="w-full bg-white py-2 px-4 space-y-4 max-h-[20rem] overflow-y-scroll">
    <div class="flex space-x-3">
      <div>
        <label for="fname"  autofocus class=" font-semibold text-xs px-2">Förnamn</label>
        <input type="text" id="chattinput_fname" name="fname" class="w-full border border-gray-400 rounded-md p-2">
      </div>
      <div>
        <label for="lname" class="font-semibold text-xs px-2">Efternamn</label>
        <input type="text" name="lname" class="w-full border border-gray-400 rounded-md p-2">
      </div>
    </div>
    <div>
      <label for="email" class="font-semibold text-xs px-2">E-post</label>
        <input type="email" name="email" class="w-full border border-gray-400 rounded-md p-2">
    </div>
    
    <div>
      <label for="subject" class="font-semibold text-xs px-2">Ämne</label>
        <input type="text" name="subject" class="w-full border border-gray-400 rounded-md p-2">
    </div>
    <div>
      <label for="orderno" class="font-semibold text-xs px-2">Ordernummer</label>
        <input type="text" name="orderno" class="w-full border border-gray-400 rounded-md p-2">
    </div>
  
  <div>
      <label for="message" class="font-semibold text-xs px-2">Meddelande</label>
        <textarea type="text" name="message" class="w-full border border-gray-400 rounded-md p-2"></textarea>
    </div>
    </div>
  
  <div class="py-4 bg-white w-full flex justify-center">
    <button class="bg-green-600 hover:bg-green-800 py-2 w-[90%] rounded-md text-white">Skicka meddelandet</button>
  </div>
</form>

<div class=" z-20 bg-white fixed bottom-0 left-0 right-0 flex justify-evenly space-x-5 py-2 lg:hidden">
    <a href="/" class="m-0 flex flex-col justify-center items-center hover:text-green-600 active:text-green-600 cursor-pointer">
        <i class="fa-solid fa-home"></i>
        <p class="text-xs">Hem</p>
    </a>
    <a href="{{ route('varor') }}" class="m-0 flex flex-col justify-center items-center hover:text-green-600 active:text-green-600 cursor-pointer">
        <i class="fa-solid fa-bars"></i>
        <p class="text-xs">Kategorier</p>
    </a>
    <a href="{{ route('favourites')}}"class=" hidden m-0 flex flex-col justify-center items-center hover:text-green-600 active:text-green-600 cursor-pointer">
        <i class="fa-solid fa-heart"></i>
        <p class="text-xs">Favoriter</p>
      </a>
      <label for="Shopping-cartbtn"  data-bs-toggle="offcanvas" data-bs-target="#cart" aria-controls="offcanvasRight" class ="m-0 cart-open-1 cursor-pointer" >
    <div class="m-0 flex flex-col relative justify-center items-center hover:text-green-600 active:text-green-600 cursor-pointer">
        
        <!--<div class="px-2 py-1 bg-red-500 border-2 border-white text-white rounded-full text-xs font-semibold tracking-wider -mt-9 -ml-4 ">-->
            
            <div class="text-xs w-[10px] h-[10px] absolute top-[-5px] right-[8px] cart-item-amount"></div>
        <!--</div>-->
        <i class="fa-solid fa-cart-shopping"></i>
        <p class="text-xs">Kundvagn</p>
        <p class="text-xs cart-total-price-overview"></p>
      </div>
    </label>
</div>



<!------ preloader---->


<!------- preloader end----------->
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

    <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 1,
      spaceBetween: 5,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },

      breakpoints: {
        0: {
          slidesPerView: 2,
          spaceBetween: 20,
        },
        450: {
          slidesPerView: 3,
          spaceBetween: 20,
        },
        768: {
          slidesPerView: 3,
          spaceBetween: 20,
        },
        1024: {
          slidesPerView: 3,
          spaceBetween: 20,
        },
      },
    });
  </script>

   @include('frontend.layouts.script')
   
   
</body>
</html>