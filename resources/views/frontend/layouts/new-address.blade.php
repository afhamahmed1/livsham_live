<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-body p-0">
    <section class="address-box">
        <div class="address-box-head">
            <h1>Skapa ny adress</h1>                           
                <h5 data-bs-dismiss="offcanvas" aria-label="Close">Avbryt</h5>
        </div>

        <div class="row">
            <form method="POST" action="{{ route('add_address') }}">
            @csrf
            <div class="side-form col-lg-11 mx-auto px-4">

                <p>Leveransadress</p>

                <div class="row g-3">
                    <div class="col-6">
                        <input type="text" name="fname" placeholder="Förnamn*" aria-label="First name">
                    </div>
                    <div class="col-6">
                        <input type="text" name="fname" placeholder="Efternamn*" aria-label="Last name">
                    </div>
                </div>

                <input type="text" name="street_address" placeholder="Gatuadress*">

                <div class="row">
                    <div class="col-6">
                        <input type="text" name="zip_code" placeholder="Postnummer" aria-label="Zip code">
                    </div>
                    <div class="col-6">
                        <input type="text" name="postal_address" placeholder="Postort*" aria-label="Postort*">
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-6">
                        <input type="number" name="mobile_number" placeholder="Mobilnummer*" aria-label="Mobile number">
                    </div>
                    <div class="col-6">
                        <input type="number" name="home_phone" placeholder="Hemtelefon*" aria-label="Hemtelefon">
                    </div>
                </div>

                <input type="text" name="port_code" placeholder="Portkod*">

                <p>Meddelande till föraren</p>

                <textarea cols="50" name="message" rows="7"></textarea>


                <button class="add-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Lägg till</button>
                
            </div>
            
            </form>
        </div>
    </section>
  </div>
</div>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRightChange" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-body p-0">
    <section class="address-box">
        <div class="address-box-head">
            <h1>Ändra adress</h1>                           
                <h5 data-bs-dismiss="offcanvas" aria-label="Close">Avbryt</h5>
        </div>

        <div class="row">
            <form method="POST" action="{{ route('add_address') }}">
            @csrf
            <div class="side-form col-lg-11 mx-auto px-4">

                <p>Leveransadress</p>

                <div class="row g-3">
                    <div class="col-6">
                        <input type="text" name="fname" placeholder="Förnamn*" aria-label="First name">
                    </div>
                    <div class="col-6">
                        <input type="text" name="fname" placeholder="Efternamn*" aria-label="Last name">
                    </div>
                </div>

                <input type="text" name="street_address" placeholder="Gatuadress*">

                <div class="row">
                    <div class="col-6">
                        <input type="text" name="zip_code" placeholder="Postnummer" aria-label="Zip code">
                    </div>
                    <div class="col-6">
                        <input type="text" name="postal_address" placeholder="Postort*" aria-label="Postort*">
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-6">
                        <input type="number" name="mobile_number" placeholder="Mobilnummer*" aria-label="Mobile number">
                    </div>
                    <div class="col-6">
                        <input type="number" name="home_phone" placeholder="Hemtelefon*" aria-label="Hemtelefon">
                    </div>
                </div>

                <input type="text" name="port_code" placeholder="Portkod*">

                <p>Meddelande till föraren</p>

                <textarea cols="50" name="message" rows="7"></textarea>


                <button class="add-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Lägg till</button>
                
            </div>
                        
            </form>
        </div>
    </section>
  </div>
</div>


