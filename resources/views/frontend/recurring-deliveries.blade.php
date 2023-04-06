@extends('frontend.master')


@section('content')



    <!-- ----------------recurring delivery------------->

    <section class="recurring-delivery">
        <div class="container">
            <div class="row">
                <div class="recurring col-lg-10 mx-auto">
                    <h3>My recurring deliveries<span>(0)</span></h3>

                    <div class="list">
                    </div>

                    <div class="subscription">
                        <i class="bi bi-exclamation-triangle-fill"></i>
                        <p>Oops! There were no subscriptions here</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

 
@endsection
@section('js')

    
@endsection
