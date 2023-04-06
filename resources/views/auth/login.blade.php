@extends('auth.master')
{{-- title --}}

@section('title','Logga in')

{{-- page scripts --}}

@section('page-styles')
<link rel="stylesheet" type="text/css" href="{{asset('css/pages/authentication.css')}}">
@endsection

@section('content')
<div class="w-full max-w-md bg-white text-black flex flex-col justify-center space-y-4 pt-6 border-2 rounded-3xl overflow-hidden">
  <form method="POST" action="{{ route('login') }}">
    @csrf
  <div class="flex flex-col justify-center items-center space-y-5">
    
      <div class="w-[80%] flex justify-between items-center"><div class="text-base font-bold"><a href="#">Logga in</a></div> <div class="text-sm"><a href="/">Annullera</a></div></div> 
      <div class="w-[80%] p-2 bg-white text-gray-400 rounded-md overflow-hidden border-2 border-gray-300 shadow-sm">
          <p class="text-base font-semibold">E-postadress</p>
          <input type="email" class="w-full focus:ring-0 focus:outline-none @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" >
          @error('email')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
                @enderror
      </div>
      <div class="w-[80%] p-2 bg-white text-gray-400 rounded-md border-2 border-gray-300">
          <p class="text-base font-semibold">Lösenord</p>
          <input type="password" class="w-full focus:ring-0 focus:outline-none @error('password') is-invalid @enderror" name="password" >
          @error('password')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
          @enderror
      </div>
      <button type="submit"  class="items-center w-[80%] px-8 py-2 text-sm font-medium text-center text-white bg-green-700 rounded-md hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">
        Logga in
      </button>
      <a href="#" class="text-base hover:underline hover:underline-offset-4">Glömde mitt lösenord</a>
    </form>
  </div>
  <div class="flex flex-col w-full">
      <div class="bg-gray-300 w-full text-center">
          <h1 class="underline py-3 text-black"><a href="{{route('register')}}">Jag vill bli kund</a></h1>
      </div>
      
  </div>
</div>
{{-- <!-- login page start -->
<section id="auth-login" class="row flexbox-container">
  <div class="col-xl-8 col-11">
    <div class="card bg-authentication mb-0">
      <div class="row m-0">
        <!-- left section-login -->
        <div class="col-md-6 col-12 px-0">
          <div class="card disable-rounded-right mb-0 p-2 h-100 d-flex justify-content-center">
            <div class="card-header pb-1">
              <div class="card-title">
                <h4 class="text-center mb-2">Welcome Back</h4>
              </div>
            </div>
            <div class="card-body">
              <form method="POST" action="{{ route('login') }}">
                @csrf
                <div class="form-group mb-50">
                  <label class="text-bold-600" for="email">Email address</label>
                  <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}"  autocomplete="email" autofocus placeholder="Email address">
                  @error('email')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
                  @enderror
                </div>
                <div class="form-group position-relative">
                  <label class="text-bold-600" for="password">Password</label>
                  <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password"  autocomplete="current-password" placeholder="Password">
                  @error('password')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                    <i class="bx bx-show-alt position-absolute" style="top: 35px;right: 10px;" onclick="showpass()"></i>
                </div>
                <div class="form-group d-flex flex-md-row flex-column justify-content-between align-items-center">
                  <div class="text-left">
                    <div class="checkbox checkbox-sm">
                      <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                      <label class="form-check-label" for="remember">
                        <small>Keep me logged in</small>
                      </label>
                    </div>
                  </div>
                  <div class="text-right">
                    <a href="{{ route('password.request') }}" class="card-link"><small>Forgot Password?</small></a>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary glow w-100 position-relative">Login
                  <i id="icon-arrow" class="bx bx-right-arrow-alt"></i>
                </button>
              </form>
              <hr>
            
            </div>
          </div>
        </div>
        <!-- right section image -->
        <div class="col-md-6 d-md-block d-none text-center align-self-center p-3">
          <img class="img-fluid" src="{{asset('app-assets/images/pages/login.png')}}" alt="branding logo">
        </div>
      </div>
    </div>
  </div>
</section> --}}
<!-- login page ends -->
<script>
  function showpass(){
      var temp = document.getElementById("password");
          if (temp.type === "password") {
              temp.type = "text";
          }
          else {
              temp.type = "password";
          }
  }
</script>
@endsection
