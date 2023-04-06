<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.js"></script>

<script src="{{ asset('app-assets/js/jquery.js') }}"></script>
<script src="{{ asset('app-assets/js/toastr.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
    <script>
        src = "https://code.jquery.com/jquery-3.6.3.min.js"
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="{{ asset('frontend/js/script.js') }}"></script>   

@yield('js')
<script>
    @if(Session::has('message'))
    toastr.options = {
       "closeButton": true,
       "progressBar": true
    }
    toastr.success("{{ session('message') }}");
    @endif
    @if(Session::has('warning'))
    toastr.options = {
       "closeButton": true,
       "progressBar": true
    }
    toastr.warning("{{ session('warning') }}");
    @endif
 
    @if(Session::has('info'))
    toastr.options = {
       "closeButton": true,
       "progressBar": true
    }
    toastr.info("{{ session('info') }}");
    @endif
 
    @if(Session::has('danger'))
    toastr.options = {
       "closeButton": true,
       "progressBar": true
    }
    toastr.danger("{{ session('danger') }}");
    @endif
    
    // $('.card-slides ').owlCarousel({
    //         loop: false,
    //         margin: 10,
    //         autoplay: false,
    //         autoHeight: true,
    //         nav: true,
    //         dots: false,
    //         responsive: {
    //             0: {
    //                 items: 2
    //             },
    //             576: {
    //                 items: 3
    //             },
    //             767:{
    //                 items: 3
    //             },
    //             1200:{
    //                 items: 4
    //             },
    //             1400:{
    //                 items: 6
    //             },
    //         }
    //     })
        
        $('.time-card-slider').owlCarousel({
        loop: false,
        margin: 10,
        nav: false,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            300: {
                items: 2
            },
            400: {
                items: 3
            },
            1000: {
                items: 3
            }
        }
    })
 </script>
 
 
