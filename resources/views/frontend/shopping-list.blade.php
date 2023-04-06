@extends('frontend.master')


@section('content')

 <!-- ----------------shopping-list------------->

    <section class="shopping">
        <div class="container">
            <div class="row">
                <div class="shopping-list col-lg-10 mx-auto">
                    <h3>My shopping lists <span>(0)</span></h3>

                    <div class="row">
                    <div class="list col-lg-12 p-3">
                        
                    </div>
                </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
           
        
        const list = document.getElementsByClassName("list")[0]
        console.log(list.children)
        if(list.children.length == 0){
            const newElement = document.createElement('p')
            newElement.style.border = 'none'
            newElement.innerHTML = "Unfortunately, no saved shopping lists (which are a clever way to shop quickly) were found."
            list.append(newElement)

        }
    
    </script>


 
@endsection
@section('js')

    
@endsection
