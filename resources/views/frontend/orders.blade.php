@extends('frontend.master')


@section('content')

<style>
    .nav-pills .nav-link {
    background: 0 0;
    border-radius: 50px;
    padding: 10px 41px;
    color: black;
    font-family: livshem-font;
  }
.nav-pills .nav-link.active {
    color: #fff;
    background-color: #268639;
    border-radius: 50px;
    padding: 10px 41px;
    font-family: livshem-font;
  }
  
 .order-content h3 {
  color: black;
  font-size: 20px;
  font-weight: 600;
  font-family: livshem-font;
}
</style>


   <section class="order">
        <div class="container">
            <div class="row col-lg-10 mx-auto">
                
                <div class="col-lg-12">
                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                          <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Kommande</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Levererade</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class=" nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Avbeställda</button>
                        </li>
                      </ul>


                      <div class="tab-content" id="">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <section class="order"> 
                                    <div class="row">
                                        <div class="order-content col-lg-12 ">
                                            <h3>Kommande leveranser <span>(0)</span></h3>

                                            <div class="row">
                                                
                                            </div>
                                        </div>
                                    </div>
                            </section>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <section class="order"> 
                                <div class="row">
                                    <div class="order-content col-lg-12 ">
                                        <h3>Levererade ordrar <span>(0)</span></h3>

                                        <div class="row">
                                            
                                        </div>
                                    </div>
                                </div>
                        </section>
                        </div>
                        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                            <section class="order"> 
                                <div class="row">
                                    <div class="order-content col-lg-12 ">
                                        <h3>Avbeställda ordrar <span>(0)</span></h3>

                                        <div class="row">
                                            
                                        </div>
                                    </div>
                                </div>
                        </section>
                        </div>
                      </div>
                      
                </div>
            </div>
        </div>
    </section>

 
@endsection
@section('js')

    
@endsection
