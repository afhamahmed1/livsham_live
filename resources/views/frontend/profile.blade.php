@extends('frontend.master')




@section('content')



    <!-- ---------------profile------------->

    <section class="profile">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <h1 class="profile-heading h1" >Profil</h1>
                </div>    
            </div>
        </div>
    </section>

    <section class="profile">
                <div class="container">
                    <div class="row">
        
                        <div class="col-lg-10 mx-auto">
        
                            <p class="form-heading">Kontakt och aviseringar</p>
                            <div class="email-box">
        
                                <form>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">E-postadress</label>
                                        <input disabled type="email" class="form-control" id="exampleInputEmail1" value ="{{ auth()->user()->email }}" placeholder="Email">
                                    </div>
                                    <div class="save-changes">
                                        <a href="#" class="profile-btn btn">Skicka in</a>
                                    </div>
                                </form>
        
                            </div>
        
        
                            <p class="form-heading">Användardata</p>
                            <div class="email-box">
        
                                <form>
                                    <div class="dob-form">
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">År:</label>
                                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="YYYY">
                                        </div>
            
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Månad:</label>
                                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="MM">
                                        </div>
            
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Dag:</label>
                                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="DD">
                                        </div>
                                    </div>
        
                                    <div class="save-changes">
                                        <a href="#" class="profile-btn btn">Skicka in</a>
                                    </div>
                                </form>
        
                            </div>
        
        
                            <p class="form-heading">Ändra lösenord</p>
                            <div class="email-box">
                 
                                <div class="change-password">
                                    <form class="mb-2" method="POST" action="{{ route('password.update') }}">
                                    @csrf
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12 mb-5">
                                            <input id="email" type="hidden" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ auth()->user()->email }}"  autocomplete="email" autofocus>
                                            <label for="exampleInputEmail1" class="form-label">Nytt lösenord</label>
                                            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password"  autocomplete="new-password">
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <label for="exampleInputEmail1" class="form-label">Upprepa nya lösenordet</label>
                                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation"  autocomplete="new-password">
                                        </div>
                                    </div>
                                </div>
        
                               
                                  
                                    <div class="save-changes">
                                        <button type="submit" class="profile-btn btn">Skicka in</button>
                                    </div>
                                </form>
                            </div>
        


                            
                                <div class="address-part">
                                    <h3>Min Adress</h3>
                                        <div class="row">
                                        @foreach($delivery_addresses as $delivery_address)
                                        <div class="col-lg-3 ">
                            
                                            <div class="add-address">
                                                <h4>{{ $delivery_address->fname}} {{$delivery_address->lname }}</h4>
                                                
                                                 <h5>{{ $delivery_address->street_address }}</h5>
                                                  <h5>{{ $delivery_address->zip_code}} {{$delivery_address->postal_address }}</h5>
                                                <span class="form-open">
                                                    <i class="bi bi-plus-circle-fill" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRightChange" aria-controls="offcanvasRightChange"></i>
                                                    <p>Förändra</p>
                                                </span>  
                                            </div>
                                        </div>
                                        @endforeach
                                        <div class="col-lg-3 ">
                            
                                            <div class="add-address">
                                                <p>Lägg till adress</p>
                            
                                                <span class="form-open">
                                                    <i class="bi bi-plus-circle-fill" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"></i>
                                                    <p>Lägg till</p>
                                                </span>  
                                        </div>
                                        </div>
                                    </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
    </section>
        
@include('frontend.layouts.new-address')
    
@endsection
@section('js')

    
@endsection
