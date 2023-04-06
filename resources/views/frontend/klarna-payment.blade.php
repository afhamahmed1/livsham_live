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
</head>
<body>
    <div class="cheack-out">

    <div class="cheack-out-nav">
        <a href="/checkout"><i class="bi bi-chevron-left"></i> Back</a>
        <img style="width:12%" src="https://livsham.softwarebyte.co/frontend/images/logo.png"/>
        <a class="Customer-service" href="#"></a>
    </div>

    <a class="to-top" href="#">
        <i class="fa fa-chevron-up"></i>
    </a>
    <section class="check-out-box">
        <div class="check-out-box3">
            <h1>Payment</h1>

            {!!$klarna_order->html_snippet!!}
        </div>
    </section>
    

     <!-- -----------------footer------------->

    <section class="footer ">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mx-auto">
                    <h2>Handla</h2>
                    <p>Sa handler du pa livesham.se</p>
                    <p>Vanliga Fragor</p>
                    <p>Koplivkor</p>
                    <p>GDPR</p>
                </div>

                <div class="col-lg-3 col-md-6 mx-auto">
                    <h2>Livesham</h2>
                    <p>Om Livesham</p>
                    <p>KonKata Oss</p>
                    <p>Facebook</p>
                    <p>Instagram</p>
                </div>

                <div class="col-lg-3 col-md-6">
                    <h2>Betalning</h2>
                    <img src="images/klarna-logo.webp" alt="">
                </div>
            </div>

            <h5 class="col-lg-11 mx-auto">Copyright © 2022 livshem.se</h5>
        </div>
    </section>

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