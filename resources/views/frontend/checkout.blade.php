
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('frontend/css/home.card.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
    <title>Checkout</title>
    <style>
        .select-day-modal .modal-footer {
    display: flex;
    justify-content: center;
}

.select-day-modal .modal-footer button {
    padding: 10px 70px;
    background-color: rgb(0, 96, 0);
    color: white;
    border-radius: 50px;
}

/* ----------time-card-slider--------- */


.time-card-slider{
    padding: 20px 0;
}

.check-out-box1 a:hover{
    background-color:white;
}

.nav-pills .nav-link.active, .nav-pills .show > .nav-link{
    color: #fff;
    background-color: #268639;
    border-radius: 50px;
     padding: 10px 30px; 
    font-family: livshem-font;
}
.deliver-btn button{
    padding-inline:20px;
}

.check-out-box2 .options span input{
    accent-color: green;
}


.cheack-out-nav a {
  color: #01a203;
  text-decoration: none;
  font-size: 17px;
  font-family: livshem-font;
}
.cheack-out-nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20px 30px;
  background-color: rgb(255, 255, 255);
  color: #f1f1f1;
  border-bottom: 2px solid #d7d7d7;
}
.check-out-box {
  width: 98%;
  margin: auto;
  display: flex;
  justify-content: center;
}
/*.check-out-box1 {*/
/*  background-color: rgb(255, 255, 255);*/
/*  padding: 50px;*/
/*  margin: 50px 0;*/
/*  border-right: 1px solid #e0e0e0;*/
/*}*/
/*.check-out-box2 {*/
/*  background-color: rgb(255, 255, 255);*/
/*  padding: 50px;*/
/*  margin: 50px 0;*/
/*  border-left: 1px solid #e0e0e0;*/
/*}*/
.deliver-btn button {
  color: white;
  background-color: #006b30;
  text-decoration: none;
  padding: 10px 40px;
  border-radius: 10px;
  font-size: 15px;
  transition: 0.5s;
}
.delivery-time button {
  color: white;
  background-color: #006b30;
  text-decoration: none;
  padding: 10px 40px;
  border-radius: 10px;
  font-size: 15px;
  transition: 0.5s;
  margin-left: 15px;
}
.deliver-btn a {
  color: white;
  background-color: #006b30;
  text-decoration: none;
  padding: 10px 40px;
  border-radius: 10px;
  font-size: 15px;
  transition: 0.5s;
}
------media query--------
@media(max-width:850px) {
    .check-out-box {
        display: block;
      }
    .check-out-box2 {
        border-top: 1px solid #e0e0e0;
      }
}

. swiper-slide label {
   Width:100%;
}

@media(max-width:500px) {
    
}



.check-out-box1 {
  background-color: rgb(255, 255, 255);
  padding: 50px 20px;
  margin: 50px 0;
  border-right: 1px solid #e0e0e0;
  width: 40%;
}
.deliver-btn a {
    color: white;
    background-color: #006b30;
    text-decoration: none;
    padding: 10px 14px;
    border-radius: 10px;
    font-size: 15px;
    transition: 0.5s;
}
.deliver-btn button {
    color: white;
    background-color: #006b30;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 10px;
    font-size: 15px;
    transition: 0.5s;
}
.delivery-time button {
    color: white;
    background-color: #006b30;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 10px;
    font-size: 15px;
    transition: 0.5s;
    margin-left: 15px;
}
@media(max-width:850px) {
    .check-out-box {
        width: 98%;
        margin: auto;
        display: flex;
        justify-content: center;
        flex-direction: column;
      }
    .check-out-box1 {
      background-color: rgb(255, 255, 255);
      padding: 50px 20px;
      margin: 50px 0;
      border: 1px solid #e0e0e0;
      width: 100%;
    }
    .check-out-box2 {
        background-color: rgb(255, 255, 255);
        padding: 50px 20px;
        margin: 50px 0;
        border: 1px solid #e0e0e0;
    }
}
    </style>
</head>

<body>

<div class="cheack-out">

    <div class="cheack-out-nav">
        <a href="/"><i class="bi bi-chevron-left"></i> Back</a>
        <img style="width:120px" src="https://livsham.softwarebyte.co/frontend/images/logo.png"/>
        <a class="Customer-service" href="#"></a>
    </div>

    <a class="to-top" href="#">
        <i class="fa fa-chevron-up"></i>
    </a>

        
    <section class="check-out-box">
        <div class="check-out-box1">
            <h1>Kundvagn</h1>
            <h3><span id="cart-item-amount"></span> varor redo för hemleverans</h3>



            <span id="dots"></span>
            <span id="more">
                <div id="cart-product">
                    
                    <div class="cart-card-counter d-flex">
                        <a><i style="background-color: rgb(255, 255, 255);"
                                class="bi bi-dash-circle-fill minus"></i></a>
                        <input type="number" class="st" value="0" size="2">
                        <a><i style="background-color: rgb(255, 255, 255);" class="bi bi-plus-circle-fill plus"></i></a>


                    </div>
                </div>

                <div class="delivery-content">
                    <!--<p class="active">Deducted discount: 43:80</p>-->
                    <!--<p>Delivery cost: 0:-</p>-->
                    <!--<p>Fee for small shopping basket: SEK 95</p>-->
                    <h3>To pay: <span id="total"> </span></h3>
                    <!--<p>Cost of goods: 135:95</p>-->
                    <p class="hidden" id="p_message"></p>
                    <p class="hidden" id="p-bar"></p>
                    <p class="hidden" id="p_message2"></p>
                    
                    <p class="hidden" id="p_message2"></p>
                    
                    <p class="hidden" id="grand_total"></p>
                    <p class="hidden" id="checkout"></p>
                    <!--<p class="active">Product discount: 43:80</p>-->
                    <!--<p>Of which VAT: 24:75</p>-->
                    <!--<p>Of which 12% VAT: 24:75</p>-->
                </div>

            </span>

            <div class="deliver-btn justify-content-end flex-wrap">
                
                <button onclick="myFunction()" id="myBtn">Visa kundvagnen</button>
            </div>
            
            @guest
             <div class="deliver-btn justify-content-center flex-wrap">
                    
                    <a href="/klarna-payment" >Pay With Klarna</a>
                </div>
            @endguest

        </div>

        @auth
        <div class="check-out-box2">
            
            <div class="delivery-time">
                <h1>Delivery time</h1>
                <button id="reserve-time-btn" data-bs-toggle="modal" data-bs-target="#select-date-time">Change delivery time</button>
            </div>

            

            <div class="delivery-options">
                
                <div class="delivery-options-1">
                    <span>
                        <input id="checkout_leave_outside" class="switch" type="checkbox">
                        <label>leave goods out side the door</label>
                    </span>
                </div>


                <div class="delivery-options-1">
                    <span>
                        <input onclick="B_myFunction()" id="myBtn2" class="switch checkout_message_toggle" type="checkbox">
                        <label>I have a message for the driver</label>
                    </span>

                    <span id="dots2"></span><span id="more2">
                        <textarea name="" id="checkout_message" cols="30" rows="3"
                            placeholder="special request for this order"></textarea>
                    </span>
                </div>


                <div class="delivery-options-1">
                    <span>
                        <input onclick="C_myFunction()" id="myBtn3" class="switch checkout_recurring_delivery_toggle " type="checkbox">
                        <label>I want to create a subscription and </label>
                    </span>

                    <span id="dots3"></span><span id="more3">

                        <div class="delivery-options-1-content">
                            <p> <i class="bi bi-check-circle-fill"></i> No commitment period or cancellation fee</p>

                            <form id="checkout_recurring_delivery" class="options">

                                <span>
                                    <input class="checkout-radio-btn" type="radio" name="weekly" id="every_week">
                                    <p>Every week</p>
                                </span>

                                <span>
                                    <input class="checkout-radio-btn" type="radio" name="weekly" id="bi_weekly">
                                    <p>Biweekly</p>
                                </span>

                            </form>

                        </div>
                    </span>

                </div>
                <hr>
                <div class="delivery-options-1 mt-4">
                    <span class="flex justify-content-between">
                        <label>Apply coupon</label>
                        <div>
                            
                        <input id="coupon" class="px-2 py-1 rounded border-solid border-2 border-green-700" type="text">
                        <div id="error"></div>
                        </div>
                    </span>
                </div>
                
                <div class="deliver-btn justify-content-center flex-wrap">
                    
                    <a href="/klarna-payment" >Pay With Klarna</a>
                </div>
            
          

            </div>

        </div>
        @endauth

        
    </section>





    <!-- -----------------side-form------------------ -->
    <div class="profile-side-form offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-body">
            <section class="address-box">
                <div class="address-box-head">
                    <h1>Select address</h1>

                    <h5 data-bs-dismiss="offcanvas" aria-label="Close">cancel</h5>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-sm-6 col-md-6 m-3">
                        <div class="add-address">
                            <p>Add address</p>

                            <span data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight-profile"
                                aria-controls="offcanvasRight">
                                <i class="bi bi-plus-circle-fill"></i>
                                <p>add</p>
                            </span>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

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


    <!-- -----------------side-form-2----------------- -->


    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight-profile"
        aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-body p-0">
            <section class="address-box">
                <div class="address-box-head">
                    <h1>Create new address</h1>
                    <h5 data-bs-dismiss="offcanvas" aria-label="Close">cancel</h5>
                </div>

                <div class="row">
                    <div class="side-form col-lg-11 mx-auto px-4">

                        <p>Delivery address</p>

                        <div class="row g-3">
                            <div class="col-6">
                                <input type="text" placeholder="First name*" aria-label="First name">
                            </div>
                            <div class="col-6">
                                <input type="text" placeholder="surname*" aria-label="Last name">
                            </div>
                        </div>

                        <input type="text" placeholder="street address*">

                        <div class="row">
                            <div class="col-6">
                                <input type="text" placeholder="Zip code" aria-label="Zip code">
                            </div>
                            <div class="col-6">
                                <input type="text" placeholder="Postort*" aria-label="Postort*">
                            </div>
                        </div>

                        <div class="row g-3">
                            <div class="col-6">
                                <input type="number" placeholder="Mobile number*" aria-label="Mobile number">
                            </div>
                            <div class="col-6">
                                <input type="number" placeholder="Hemtelefon*" aria-label="Hemtelefon">
                            </div>
                        </div>

                        <input type="text" placeholder="This. portcode*">

                        <p>Message to the driver</p>

                        <textarea cols="50" rows="7"></textarea>


                        <a href="a" class="add-btn">add</a>

                    </div>
                </div>
            </section>
        </div>
    </div>
    
    

    <!-- -----------------footer------------->

 <footer class=" w-full overflow-hidden  mt-4">  
      
    <div class="bg-[#b1e1a0] text-black flex flex-col justify-center items-center py-10 px-4">
        <div class="w-full max-w-7xl">
          <div class="w-full grid sm:grid-cols-2 lg:grid-cols-3">
            <ul class="px-4">
              <li class="border-b-2 border-gray-500 text-2xl font-bold mb-3 pb-2 whitespace-nowrap">Handla </li>
              <li> Så handlar du livshem.se </li>
              <li> <a href="{{ route('faqs') }}"> Vanliga frågor</a></li>
              <li><a href="{{ route('purchaseterms') }}">köpvilkor</a> </li>
              <!--<li><a href="{{ route('gdpr') }}">GDPR</a> </li>-->
              <li><a href="{{ route('privacypolicy') }}">Integritetspolicy</a> </li>
              <li><a href="{{ route('cookiepolicy') }}">Cookiepolicy</a> </li>
            </ul>
            <ul class="px-4">
              <li class="border-b-2 border-gray-500 text-2xl font-bold mb-3 pb-2 whitespace-nowrap">Livshem </li>
              <li > <a href="{{ route('aboutus') }}"> Om Livshem</a></li>
              <li onclick="openChat()" style="cursor:pointer">Kontaka Oss</li>
              
            </ul>
            
            <ul class="px-4">
              <li class="border-b-2 border-gray-500 text-2xl font-bold mb-3 pb-2 whitespace-nowrap">Betalning </li>
              <li>
                  <img src="{{ asset('frontend/images/klarna.png') }}" alt="klarna-logo" class="w-[120px] p-2 rounded-md ">
              </li>
              {{-- <li class="text-center text-3xl space-x-4 my-4"> 
                <i class="fa-regular fa-credit-card hover:text-green-500"></i>
                <i class="fa-brands fa-cc-paypal hover:text-green-500"></i>
                <i class="fa-brands fa-cc-mastercard hover:text-green-500"></i>
                <i class="fa-brands fa-cc-visa hover:text-green-500"></i>
              </li> --}}
            </ul>
            
            <div class="mt-10 px-4 text-sm">
              <p>Copyright &copy; 2023 <a href="#" class="underline underline-offset-3">livshem.se</a></p>
            </div>
          </div>
        </div>
    </div>
</footer>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="{{ asset('frontend/js/script.js') }}"></script>
    
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

</body>
</html>