

// function cardCounter(){
//     const body = document.getElementById('body')
//     const cardCounter = body.getElementsByClassName('card-counter')
//     // console.log(cardCounter)
//     for (let i = 0; i < cardCounter.length; i++) {
//         const element = cardCounter[i];
        
//         const minusParent = element.querySelectorAll('a')[0]
//         const plusParent = element.querySelectorAll('a')[1]
//         const minus = element.getElementsByClassName('minus')[0]
//         const plus = element.getElementsByClassName('plus')[0]
//         const st = element.getElementsByClassName('st')[0]
//         const firstbtn = element.getElementsByClassName('first-btn')[0]
        
//         minus.style.display = 'none' 
//         st.style.display = 'none'
//         // firstbtn.style.display = 'none'
//         plus.style.display = 'none'
//         element.style.backgroundColor = 'white' 
    
//         if(firstbtn){
//             firstbtn.addEventListener('click', (e)=>{
                
//                 st.value = parseInt(st.value) + 1
//                 debounce(AddQuantity(firstbtn))
//                 if(minus.style.display == 'none'){
//                     minus.style.display = 'block'
//                     firstbtn.style.display = 'none'
//                     element.style.backgroundColor = 'rgb(232, 232, 232)'
//                     plus.style.display = 'block'
    
//                 }
//                 if(st.style.display == 'none'){
//                     st.style.display = 'block'
//                 }   
//             })
    
            
//         }   
    
    
//         if(minusParent){
//             minusParent.addEventListener('click', (e)=>{
                
//                 if(st.value < 2){
//                     st.value = 0
                    
//                     debounce(RemoveQuantity(minusParent));
//                     minus.style.display = 'none' 
//                     st.style.display = 'none' 
//                     element.style.backgroundColor = 'white'
//                     firstbtn.style.display = 'block'
//                     plus.style.display = 'none'
//                 }else{
//                     debounce(RemoveQuantity(minusParent));
//                 }
//             })
    
            
//         }   
//         if(plusParent){
//             plusParent.addEventListener('click', (e)=>{
//                 st.value = parseInt(st.value) + 1
//                 debounce(AddQuantity(plusParent))
//                 if(minus.style.display == 'none'){
//                     minus.style.display = 'block'
//                     element.style.backgroundColor = 'rgb(232, 232, 232)'
//                 }
//                 if(st.style.display == 'none'){
//                     st.style.display = 'block'
//                 }
//             })
//         }
    
        
//     }

// }

function cardCounter(){
    const body = document.getElementById('body')
    const cardCounter = body.getElementsByClassName('card-counter')
    // console.log(cardCounter)
    for (let i = 0; i < cardCounter.length; i++) {
        const element = cardCounter[i];
        
        const minusParent = element.querySelectorAll('a')[0]
        const plusParent = element.querySelectorAll('a')[1]
        const minus = element.getElementsByClassName('minus')[0]
        const plus = element.getElementsByClassName('plus')[0]
        const st = element.getElementsByClassName('st')[0]
        const firstbtn = element.getElementsByClassName('first-btn')[0]
        
        // minus.style.display = 'none' 
        // st.style.display = 'none'
        // // firstbtn.style.display = 'none'
        // plus.style.display = 'none'
        element.style.backgroundColor = 'white' 
    
    //     if(firstbtn){
    //         firstbtn.addEventListener('click', (e)=>{
                
    //             st.value = parseInt(st.value) + 1
    //             debounce(AddQuantity(firstbtn))
    //             if(minus.style.display == 'none'){
    //                 minus.style.display = 'block'
    //                 firstbtn.style.display = 'none'
    //                 element.style.backgroundColor = 'rgb(232, 232, 232)'
    //                 plus.style.display = 'block'
    
    //             }
    //             if(st.style.display == 'none'){
    //                 st.style.display = 'block'
    //             }   
    //         })
    
            
    //     }   
    
    
    //     if(minusParent){
    //         minusParent.addEventListener('click', (e)=>{
                
    //             if(st.value < 2){
    //                 st.value = 0
                    
    //                 debounce(RemoveQuantity(minusParent));
    //                 minus.style.display = 'none' 
    //                 st.style.display = 'none' 
    //                 element.style.backgroundColor = 'white'
    //                 firstbtn.style.display = 'block'
    //                 plus.style.display = 'none'
    //             }else{
    //                 debounce(RemoveQuantity(minusParent));
    //             }
    //         })
    
            
    //     }   
    //     if(plusParent){
    //         plusParent.addEventListener('click', (e)=>{
    //             st.value = parseInt(st.value) + 1
    //             debounce(AddQuantity(plusParent))
    //             if(minus.style.display == 'none'){
    //                 minus.style.display = 'block'
    //                 element.style.backgroundColor = 'rgb(232, 232, 232)'
    //             }
    //             if(st.style.display == 'none'){
    //                 st.style.display = 'block'
    //             }
    //         })
    //     }
    
        
    }

}


const dropdownbox = document.getElementById('SearchInput')

if(dropdownbox){
    dropdownbox.oninput = darkbg;
    // dropdownbox.onchange = lightbg;
}
function darkbg(){
    const box =document.getElementById('box')
    const body = document.getElementById('body')
    if(box){
        box.style.display = 'block';
        
        body.style.overflow ="hidden"
    }
    
}
function lightbg(){
    const box =document.getElementById('box')
    const body = document.getElementById('body')
    if(box){
    box.style.display = 'none';
    
        body.style.overflowY ="scroll"
    }
}


const q1Editor = document.getElementsByClassName('ql-editor')

for (let i = 0; i < q1Editor.length; i++) {
    const element = q1Editor[i]
    element.setAttribute('contenteditable', 'false')
    
}

const qlClipboard = document.getElementsByClassName('ql-clipboard')
for (let i = 0; i < qlClipboard.length; i++) {
    const element = qlClipboard[i]
    element.classList.add('hidden')
    
}

const qlTooltip = document.getElementsByClassName('ql-tooltip')
for (let i = 0; i < qlTooltip.length; i++) {
    const element = qlTooltip[i]
    element.classList.add('hidden')
}
// const editablecontent = document.getAttribute()

// ---------------cart-card-Counter----------------

const cartcardCounter = document.getElementsByClassName('cart-card-counter')
// console.log(cardCounter)
for (let i = 0; i < cartcardCounter.length; i++) {
    const element = cartcardCounter[i];
    // console.log(element.getElementsByClassName('minus'))
    const minus = element.getElementsByClassName('minus')[0]
    const plus = element.getElementsByClassName('plus')[0]
    const st = element.getElementsByClassName('st')[0]
    minus.style.display = 'block' 
    st.style.display = 'block'
    plus.style.display = 'block'
    // element.style.backgroundColor = 'white' 

        if(plus){
            plus.addEventListener('click', ()=>{
                
                st.value = parseInt(st.value) + 0
                if(minus.style.display == 'none'){
                    minus.style.display = 'block'
                    element.style.backgroundColor = 'rgb(232, 232, 232)'
                    plus.style.display = 'block'

                }
                if(st.style.display == 'none'){
                    st.style.display = 'block'
                }   
            })

            
        }   


    if(minus){
        minus.addEventListener('click', ()=>{
            
            if(st.value < 2){
                st.value = 0
                minus.style.display = 'block' 
                st.style.display = 'block' 
                // element.style.backgroundColor = 'white'
                plus.style.display = 'block'
            }else{st.value = st.value - 1}
        })

        
    }   
    if(plus){
        plus.addEventListener('click', ()=>{
            st.value = parseInt(st.value) + 1
            if(minus.style.display == 'none'){
                minus.style.display = 'block'
                // element.style.backgroundColor = 'rgb(232, 232, 232)'
            }
            if(st.style.display == 'none'){
                st.style.display = 'block'
            }
        })
    }

    
}


// ------------preview-----------


let previewContainer = document.querySelector('.products-preview');
if(previewContainer){
    let previewBox = previewContainer.querySelectorAll('.preview');
const body = document.getElementById('body')



document.querySelectorAll('.home-cards .card-image').forEach(product =>{
    product.onclick = () =>{
        previewContainer.style.display = 'flex'
        let name = product.getAttribute('data-name');
        previewBox.forEach(preview =>{
            let target = preview.getAttribute('data-target');
            if(name == target){
                preview.classList.add('active');
                body.style.overflow = ('hidden');
            }
        })
    }
});
previewBox.forEach(close =>{
    close.querySelector('.bi-x').onclick = () =>{
        close.classList.remove('active');
        previewContainer.style.display = 'none'
        body.style.overflow = ('scroll');
    };
});
}





// let previewContainer = document.querySelector('.products-preview');
// if(previewContainer){
//     let previewBox = previewContainer.querySelectorAll('.preview');
// const body = document.getElementById('body')

// document.querySelectorAll('.home-cards .card-image').forEach(product =>{
//     product.onclick = () =>{
//         previewContainer.style.display = 'flex'
//         let name = product.getAttribute('data-name');
//         previewBox.forEach(preview =>{
//             let target = preview.getAttribute('data-target');
//             if(name == target){
//                 preview.classList.add('active');
//                 body.style.overflow = ('hidden');
//             }
//         })
//     }
// });
// previewBox.forEach(close =>{
//     close.querySelector('.bi-x').onclick = () =>{
//         close.classList.remove('active');
//         previewContainer.style.display = 'none'
//         body.style.overflow = ('scroll');
//     };
// });
// }





// ---------------filter--------------

var open = document.getElementById("open");

function showMenu(){
    open.style.left = "0";
}
function showMenu(){
    open.style.left = "-700px";
}

// ---------------navbar--------------


const chc = document.querySelector('#shopping-cart-checkbox');
var element = document.getElementById("SideNav");
function FuncClick(){
    if(chc.checked){
        element.classList.remove("-left-[17rem]");
        element.classList.add("left-0");
    }else{
        element.classList.remove("left-0");
        element.classList.add("-left-[17rem]");
        }
}
const chka = document.querySelector('#Shopping-cartbtn');
var element2 = document.getElementById("Shopping-cart-menu");
function FuncClick2(){
    if(element2){
        if(chka.checked){
            
                element2.classList.add("shop-visible");
                element2.classList.remove("hide-visible");
            
        }else{
            element2.classList.add("hide-visible");
            element2.classList.remove("shop-visible");
            }
    }
}


var count = 1;
function Decrement(element){
    var x = element.nextElementSibling;
    count = x.innerHTML;
    if(count > 1){
        count--;
        x.innerHTML = count;
        let cart_count_input = element.parentElement.querySelector("#cart_count_input");
        cart_count_input.setAttribute('value',count);
      
        cartfun();
    }
};
function Increment(element){
    var x = element.previousElementSibling;
    count = x.innerHTML;
    if(count < 10){
        count++;
        x.innerHTML = count;
        let cart_count_input = element.parentElement.querySelector("#cart_count_input");
        cart_count_input.setAttribute('value',count);
        cartfun();
    } 
};






// ---------------add to cart--------------

const cart = document.getElementsByClassName('cart')[0]
const continueShopping = document.getElementById('continue-shopping')

if(continueShopping){
    continueShopping.addEventListener('click', ()=>{
        cart.style.right = '-900px'
        body.style.overflow = ('scroll');
    })
}

const cartOpen = document.getElementsByClassName('cart-open')[0]

if(cartOpen){
    cartOpen.addEventListener('click', ()=>{
        cart.style.right = '0px'
        body.style.overflow = ('hidden');
    })
}

// ---------down-nav-add to cart----------------
const cartOpen1 = document.getElementsByClassName('cart-open-1')[0]
const cartOpen2 = document.getElementById('cart-open-1')


if(cartOpen1){
    cartOpen1.addEventListener('click', ()=>{
        if(cart){
            cart.style.right = '0px'
        }
    })
    
}

if(cartOpen2){
    continueShopping.addEventListener('click', ()=>{
        if(cart){
            
        cart.style.right = '-900px'
        }
    })
}



// ------------------------filter-----------------------


const filterbox = document.getElementsByClassName('filter-box')[0]
const cancel = document.getElementById('cancel')

if(cancel){
    cancel.addEventListener('click', ()=>{
        filterbox.style.left = '-900px'
    })
}

const filterOpen = document.getElementsByClassName('filter')[0]

if(filterOpen){
    filterOpen.addEventListener('click', ()=>{
        filterbox.style.left = '0px'
    })
}



const slideform = document.getElementsByClassName('slide-form')[0]
const formcancel = document.getElementById('form-cancel')

if(formcancel){
    formcancel.addEventListener('click', ()=>{
        slideform.style.right = '-900px'
    })
}

const formopen = document.getElementsByClassName('form-open')[0]

if(formopen){
    formopen.addEventListener('click', ()=>{
        if(slideform){
        slideform.style.right = '0px'
            
        }
    })
}





const chatbox = document.getElementById('ChatBox');
const backdrop = document.getElementById('box');
const body = document.getElementById('body');
function openChat(){
    chatbox.classList.remove('hidden');
    if(backdrop){
        backdrop.style.display = 'block'
        body.style.overflow ="hidden"
        const chattinput_fname = document.getElementById('chattinput_fname')
        // console.log(chattinput_fname)
        if(chattinput_fname){
        
            chattinput_fname.focus()
        }
    }
};
function closeChat(){
    chatbox.classList.add('hidden');
    backdrop.style.display = 'none'
    body.style.overflowY ="scroll"
    
};


// ---------------------------Load More
// $(document).ready(function(){
//     $(".card-box").slice(0, 18).show();
//     $("#loadMore").on("click", function(e){
//       e.preventDefault();
//       $(".card-box:hidden").slice(0, 12).slideDown();
//       if($(".card-box:hidden").length == 0) {
//         $("#loadMore").css("display", "none");
//       }
//     });
    
//   })



    





  



function GetProducts() {
    let products = document.getElementById("products");
    $.ajax({
        url: "https://livsham.softwarebyte.co/api/products",
        type: "GET",
        data: {},
        success: function (data) {
            // console.log(data)
            // data = JSON.parse(data);
            for (i = 0; i < data.length && i < 12; i++) {
                let div = document.createElement("div");
                div.className = "cards col-xxl-2 col-xl-2 col-lg-3 col-md-4 col-sm-6 col-xs-6";
                div.style = "display:block";
                let div1 = document.createElement("div");
                div1.className = "card h-100";
                div1.id = data[i].id;
                let div5 = document.createElement("div");
                div5.className = "card-image";
                div5.setAttribute("data-name", "p-1");
                let img = document.createElement("img");
                img.className = "card-img-top";
                img.setAttribute("src", data[i].image);
                let div6 = document.createElement("div");
                div6.className = "card-body";
                let h5 = document.createElement("h5");
                h5.className = "card-title text-center";
                let h4 = document.createElement("h4");
                h4.className = "tag mx-auto mb-2";
                h4.innerHTML = data[i].price;
                h5.innerHTML = data[i].name;
                let div8 = document.createElement("div");
                div8.className = "card-counter d-flex";
                div8.style = "background-color: white;";
                let a1 = document.createElement("a");
                a1.classList.add("custom-d-none");
                a1.addEventListener("click", function () {
                    RemoveQuantity(this);
                });
                let i2 = document.createElement("i");
                i2.className = "bi bi-dash-circle-fill minus";
                let input = document.createElement("input");
                input.type = "number";
                input.className = "st text-center custom-d-none";
                input.value = 0;
                let a2 = document.createElement("a");
                a2.addEventListener("click", function () {
                    AddQuantity(this);
                });
                let i3 = document.createElement("i");
                i3.className = "bi bi-plus-circle-fill plus d-none";
                let btn = document.createElement("button");
                btn.className = "first-btn";
                btn.addEventListener("click", function () {
                    this.classList.add("d-none");
                    btn = this.previousElementSibling;
                    btn.children[0].classList.remove("d-none");
                    AddQuantity(btn);
                });
                let p = document.createElement("p");
                p.innerHTML = "Add";
                btn.appendChild(p);
                a2.appendChild(i3);
                a1.appendChild(i2);
                div8.appendChild(a1);
                div8.appendChild(input);
                div8.appendChild(a2);
                div8.appendChild(btn);
                div6.appendChild(h5);
                div6.appendChild(h4);
                div6.appendChild(div8);
                div5.appendChild(img);
                div1.appendChild(div5);
                div1.appendChild(div6);
                div.appendChild(div1);
                products.appendChild(div);





            }
        }
    });
}

// -----------------cart-------------------- //

const debounce = (func, delay=400) => {
        let debounceTimer
        return function() {
            const context = this
            const args = arguments
                clearTimeout(debounceTimer)
                    debounceTimer
                = setTimeout(() => func.apply(context, args), delay)
        }
    }

const getQuantityRequest = null
function GetQuantity(qty, id) {
    
   
    $.ajax({
          url: "https://livsham.softwarebyte.co/api/cart/"+id,
          type: "GET",
          beforeSend : function()    {           
                if(getQuantityRequest != null) {
                    getQuantityRequest.abort();
                }
            },
          success: function (data) {
            qty.value = data[0];
            AddtoCart(id, qty.value);
          }
        });
      
    // $.ajax({
    //     url: "https://livsham.softwarebyte.co/api/cart/"+id,
    //     type: "GET",
    //     // data: {
    //     // },
    //     success: function (data) {
    //         // data = JSON.parse(data);
    //         qty.value = data[0];
    //         AddtoCart(id, qty.value);
    //     }
    // });
}

function Checkout() {
    $.ajax({
        url: "functions.php",
        type: "POST",
        data: {
            "function": "Checkout"
        },
        success: function (data) {
            // data = JSON.parse(data);
            if (data.status == "success") {
                Swal.fire({
                    icon: 'success',
                    title: data.message,
                    showConfirmButton: false,
                    timer: 1500
                }).then(function () {
                    location.reload();
                });
            }
        }
    });
}

function AddQuantity(btn) {

    btn.classList.remove("plus");
    id = btn.parentNode.parentNode.parentNode.id;
    qty = btn.previousElementSibling;
    
    qty.classList.remove("custom-d-none");
    qty.previousElementSibling.classList.remove("custom-d-none");
    // AddtoCart(id, qty.value);
    GetQuantity(qty, id)
    GetCartProducts()

}

function inCart(){
    
}

function RemoveQuantity(btn) {
    id = btn.parentNode.parentNode.parentNode.id;
    qty = btn.nextElementSibling;
    qty.value = parseInt(qty.value) - 1;
    if (qty.value <= 0) {
        qty.classList.add("custom-d-none");
        btn.classList.add("custom-d-none");
        AddtoCart(id, 0);
    }else{
        
    AddtoCart(id, qty.value);
    
    }
     GetCartProducts()
}

let addToCartRequest = null
function AddtoCart(id, qty) {
    addToCartRequest = $.ajax({
        url: "https://livsham.softwarebyte.co/api/cart/"+id+"/"+qty,
        type: "POST",
        beforeSend : function()    {           
                if(addToCartRequest != null) {
                    addToCartRequest.abort();
                }
            },
        success: function (data) {
            GetCartProducts()
        }
    })
}


let getCartProductsRequest = null
function GetCartProducts() {
    let cart = document.getElementById("cart-product");
    document.getElementById("total").innerHTML = "";
    getCartProductsRequest =  $.ajax({
        url: "https://livsham.softwarebyte.co/api/cart",
        type: "GET",
        beforeSend : function()    {           
                if(getCartProductsRequest != null) {
                    getCartProductsRequest.abort();
                }
            },
        success: function (data) {
            // data = JSON.parse(data);
            if (data.status != "error") {
                cart.innerHTML = "";
                let totalquantity=0
                let total = 0;
                let memory = []
                let totaldiscount = 0
                for (let i = 0; i < data[0].length; i++) {
                    
                    
                
                    if(!data[1][data[0][i]]){
                        
                        data[1][data[0][i]] = []
                    }
                    for (let j = 0; j < data[1][data[0][i]].length; j++) {
                        
                            category = document.createElement("h2");
                        if(!memory.includes(data[1][data[0][i]][j]['category'])){
                            
                            
                            category.classList.add("text-xl")
                            category.innerHTML = data[0][i];
                            memory.push(data[1][data[0][i]][j]['category'])
                        }
                        div0 = document.createElement("div");
                        div0.id = data[1][data[0][i]][j]["id"];
                        div = document.createElement("div");
                        div.className = "selected-product";
                        span = document.createElement("span");
                        img = document.createElement("img");
                        img.src = data[1][data[0][i]][j]["image"];
                        img.style = "width: 50px;";
                        div1 = document.createElement("div");
                        div1.className = "s-product-detail";
                        p = document.createElement("p");
                        p.classList.add('cursor-pointer')
                        p.setAttribute('data-bs-toggle', 'modal')
                        p.setAttribute('data-bs-target', '#cart-'+data[1][data[0][i]][j]["id"])
                        p.innerHTML = data[1][data[0][i]][j]["name"];
                        h5 = document.createElement("h5");
                        if(data[1][data[0][i]][j]["discount_price"]){
                            
                            let discount = document.createElement("span");
                            let discount_price = parseInt(((data[1][data[0][i]][j]["discount_price"].toString()).replace(':','.'))*data[1][data[0][i]][j]["qty"]).toFixed(2)+":-";
                            let original_price = parseInt(((data[1][data[0][i]][j]["price"].toString()).replace(':','.'))*data[1][data[0][i]][j]["qty"]).toFixed(2)+":-";
                            discount.classList.add('!no-underline', 'discounted-price')
                            discount.innerHTML = discount_price
                            let original = document.createElement("span");
                            original.classList.add('line-through', '!text-slate-900', 'original-price')
                            original.innerHTML = original_price
                            h5.appendChild(discount)
                            h5.appendChild(original)
                        }else{
                            
                            let original = document.createElement("span");
                            let original_price = parseInt(((data[1][data[0][i]][j]["price"].toString()).replace(':','.'))*data[1][data[0][i]][j]["qty"]).toFixed(2)+":-";
                            original.classList.add( '!text-slate-900', '!no-underline', 'original-price')
                            original.innerHTML = original_price
                            h5.appendChild(original)
                        }
                        div2 = document.createElement("div");
                        div2.className = "cart-card-counter d-flex";
                        let a1 = document.createElement("a");
                        let i1 = document.createElement("i");
                        let a2 = document.createElement("a");
                        let i2 = document.createElement("i");
                        let input1 = document.createElement("input");
                        input1.type = "number";
                        input1.className = "st";
                        input1.value = data[1][data[0][i]][j]["qty"];
                        input1.readOnly = true;
                        i1.className = "bi bi-plus-circle-fill plus";
                        i2.className = "bi bi-dash-circle-fill minus";
                        a1.onclick = function () {
                            AddQuantity(this)
                        };
                        a2.onclick = function () {
                            RemoveQuantity(this)
                        };
                        a1.appendChild(i1);
                        a2.appendChild(i2);
                        div2.appendChild(a2);
                        div2.appendChild(input1);
                        div2.appendChild(a1);
                        div1.appendChild(p);
                        div1.appendChild(h5);
                        span.appendChild(img);
                        span.appendChild(div1);
                        div.appendChild(span);
                        div.appendChild(div2);
                        div0.appendChild(div);
                        cart.appendChild(category);
                        cart.appendChild(div0);
                        let price = (data[1][data[0][i]][j]["price"]).toString().slice(0, 4);
                        let discount_price = "0"
                        if(data[1][data[0][i]][j]["discount_price"]){
                            
                         discount_price = (data[1][data[0][i]][j]["discount_price"]).toString().slice(0, 4);
                        }
                        // console.log(discount_price)
                        price = price.split(" ");
                        price = price[0].replace(":", ".");
                        discount_price = discount_price.split(" ");
                        discount_price = discount_price[0].replace(":", ".");
                        let quantity = parseInt(data[1][data[0][i]][j]["qty"]);
                        
                        if(discount_price > 0){
                            
                        totaldiscount += ((parseFloat(price)-parseFloat(discount_price)) * quantity);
                        }else{
                            totaldiscount += 0
                        }
                        // 
                        // console.log(totaldiscount)
                        total += (parseFloat(price) * quantity);
                        totalquantity = (totalquantity + quantity)
                        
                        let preview = previewModel(data[1][data[0][i]][j], 'cart')
                        let cartPreview = document.getElementById('cart-preview-cards')
                        if(cartPreview){
                            cartPreview.innerHTML += preview
                        }
                        let previewCounter  = document.getElementById('cart-'+data[1][data[0][i]][j]['id'])
                        
                        if(previewCounter){
                            const element = previewCounter.getElementsByClassName('card-counter')[0]
                            const minusParent = element.querySelectorAll('a')[0]
                            const plusParent = element.querySelectorAll('a')[1]
                            const minus = element.getElementsByClassName('minus')[0]
                            const plus = element.getElementsByClassName('plus')[0]
                            const st = element.getElementsByClassName('st')[0]
                            const firstbtn = element.getElementsByClassName('first-btn')[0]
                            
                            minus.style.display = 'none' 
                            st.style.display = 'none'
                            // firstbtn.style.display = 'none'
                            plus.style.display = 'none'
                            element.style.backgroundColor = 'white' 
                        
                            if(firstbtn){
                                firstbtn.addEventListener('click', (e)=>{
                                    
                                    st.value = parseInt(st.value) + 1
                                    debounce(AddQuantity(firstbtn))
                                    if(minus.style.display == 'none'){
                                        minus.style.display = 'block'
                                        firstbtn.style.display = 'none'
                                        element.style.backgroundColor = 'rgb(232, 232, 232)'
                                        plus.style.display = 'block'
                        
                                    }
                                    if(st.style.display == 'none'){
                                        st.style.display = 'block'
                                    }   
                                })
                        
                                
                            }   
                        
                        
                            if(minusParent){
                                minusParent.addEventListener('click', (e)=>{
                                    
                                    if(st.value < 2){
                                        st.value = 0
                                        
                                        debounce(RemoveQuantity(minusParent));
                                        minus.style.display = 'none' 
                                        st.style.display = 'none' 
                                        element.style.backgroundColor = 'white'
                                        firstbtn.style.display = 'block'
                                        plus.style.display = 'none'
                                    }else{
                                        debounce(RemoveQuantity(minusParent));
                                    }
                                })
                        
                                
                            }   
                            if(plusParent){
                                plusParent.addEventListener('click', (e)=>{
                                    st.value = parseInt(st.value) + 1
                                    debounce(AddQuantity(plusParent))
                                    if(minus.style.display == 'none'){
                                        minus.style.display = 'block'
                                        element.style.backgroundColor = 'rgb(232, 232, 232)'
                                    }
                                    if(st.style.display == 'none'){
                                        st.style.display = 'block'
                                    }
                                })
                            }
                            
                        }

                    }
                }
               
                cartItemBtn = document.getElementById('cart-item-amount')
                
                
                TotalCartCount(totalquantity)
                
                total1 = total.toFixed(1).toString().replace(".", ":");
                
                p_message = 1000 - total;
                if (p_message > 0) {
                    p_message = p_message.toFixed(1).toString().replace(".", ":");
                    if(document.getElementById("p_message")){
                        
                    document.getElementById("p_message").innerHTML = "Handla för " + p_message + " till";
                    }
                    percent= (total/1000)*100;
                    document.getElementById("p-bar").style.width = percent+"%";
                    if(total > 0){
                        
                        total += 95;
                    }
                }else if (p_message <= 0) {
                    document.getElementById("p_message").innerHTML = "Din leverans är gratis";
                    document.getElementById("p_message2").innerHTML = "";
                    document.getElementById("p-bar").style.width = "100%";
                    document.getElementById("delivery").innerHTML = "Fri";
                }
                document.getElementById("grand_total").innerHTML = "SEK "+total-totaldiscount;
                discountPrice(totaldiscount)
                
                let grand_total = (total-totaldiscount).toFixed(2).toString().replace(".", ":")
                TotalCartPrice(grand_total)
                document.getElementById("total").innerHTML = "SEK "+grand_total;
                document.getElementById("checkout").disabled = false;
            }
        }
    });
}


function card(data, modal_class="data",  classes = "card-box col-xxl-2 col-xl-3  col-md-4 col-sm-6 col-xs-6 px-1 py-3 col-6", incarousel=false){
    let card =''
    if (incarousel){
        card+= '<div class="item">'
    }
    let favourite = ''
    if(data.is_favourite){
        favourite = '<i id="likebtn" class="bi bi-heart-fill likebtn" style="color: red;"></i>'
    }else{
        favourite = '<i id="likebtn" class="bi bi-heart-fill likebtn"></i>'
    }
    let category = ''
    if(data.category_id)
    {
        category = `<h4><b><a href="https://livsham.softwarebyte.co/product/category?category=${data.category_id}"> ${data.category} </a></b></h4>`
    }
    card +=
    `
    <div class="${classes}">
        <div class="card h-100" id="${data.id}">
            
            <div class="t-icon relative">
                <div class="discount absolute right-10 ${(data.discount_price <= 0) ? 'hidden' : '' }" >
                    <i class="fa fa-certificate"></i>
                    <h5>${data.discount_price}:-</h5>
                </div>
                <div class="favourite">
                      ${favourite}
                    
                </div>
            </div>
            <div class="card-image" data-bs-toggle="modal" data-bs-target="#${modal_class}-${data.id}">
                <img card-image src="${data.image}" alt="${data.name}" class="card-img-top">
            </div>
            <div class="card-body">
                <h5 class="card-title text-center" data-bs-toggle="modal" data-bs-target="#${modal_class}-${data.id}">${data.name}</h5>
                <h4 class="tag mx-auto">${data.weight} </h4>
                <div class="price">
                    <span>
                        
                        ${category}
                        <h4 class="text-[10px]">JFR-Pris:${data.price_per_item}</h4>
                    </span>
                    <span  class="text-right">
                        <h5 class="discount-price ${data.discount_price <= 0 ? 'hidden' : '' }">${data.discount_price > 0 ? data.discount_price : '' }:-</h5>
                        <h5 class="${ data.discount_price <= 0 ? '' : 'real-price' }">${ data.discount_price <= 0 ? data.price : '<s>'+data.price+'</s>' }:-</h5>
                    </span>
                </div>
                <div class="card-counter-div card-counter d-flex" style="${(data.cart_quantity > 0) ? 'justify-content:space-between;background-color:rgb(232, 232, 232)' : 'justify-content:flex-end;background-color:white'} ">
                    <a class="card-minus-div ${(data.cart_quantity > 0) ? '' : 'hidden'}"><i class="bi bi-dash-circle-fill minus"></i></a>
                    <input type="number" class="st   ${(data.cart_quantity > 0) ? '' : 'hidden'} card-quantity-div" value="${data.cart_quantity}" size="2">
                    <a class="card-plus-div ${(data.cart_quantity > 0) ? '' : 'hidden'} "><i class="bi bi-plus-circle-fill plus"></i></a>
                    <button class="first-btn  ${(data.cart_quantity > 0) ? 'hidden' : ''}" >
                        Köp
                    </button>
                </div>
            </div>
        </div>
    </div>
    `
    if (incarousel){
        card+= '</div>'
    }
    // console.log(card)
    return card
}



function previewModel(data, modal_name="data"){
    // console.log(data)
    let preview_discount_price = (data.discount_price > 0) ? data.discount_price : data.price
    let preview_price_hidden = (data.discount_price <= 0) ? "hidden" : ""
    let preview_price = (data.discount_price <= 0) ? data.price : data.price
    let origin = ''
    
    let favourite = ''
    if(data.is_favourite){
        favourite = '<i id="likebtn" class="bi bi-heart-fill likebtn" style="color: red;"></i>'
    }else{
        favourite = '<i id="likebtn" class="bi bi-heart-fill likebtn"></i>'
    }
    let category = ''
    let sub_category = ''
    let subsub_category = ''
    let product_information = ''
    let nutritional_content = ''
    if(data.category_id)
    {
        category = `<h4><a href="https://livsham.softwarebyte.co/product/category?category=${data.category_id}"> ${data.category} </a>/ </h4>`
    }
    if(data.sub_category_id)
    {
        sub_category = `<h4><a href="https://livsham.softwarebyte.co/product/sub_cat/${data.sub_category_id}"> ${data.sub_category} </a> / </h4>`
    }
    
    if(data.subsub_category_id)
    {
        subsub_category = `<h4><a href="https://livsham.softwarebyte.co/product/subsub_cat/${data.subsub_category_id}"> ${data.subsub_category} </a> </h4>`
    }
    if(data.product_information){
        product_information =
        `
        <h3> <strong> Produktinformation</strong></h3>
        <br>
        <p>${data.product_information}</p>
        <br>
        `
    }
    if(data.origin){
        origin = 
        `
        <div class="product-country">
            <i class="bi bi-globe"></i>

            <div class="country-info">
                <p>Ursprung:- ${data.origin}</p>
            </div>
        </div>
        `
    }
    if(data.nutritional_content){
        nutritional_content = 
        `
        <h3> <strong> Näringsinnehåll</strong></h3>
        <br>
        
        <p>${data.nutritional_content}</p>
        <br>
        `
    
    }
    let storage  = ''
    if(data.storage){
        storage = 
        `
        <h3> <strong>Lagring</strong></h3>
        <br>
        <p>${data.storage}</p>
        <br>
        `
    }
    let other_information = ''
    if(data.other_information){
        other_information = 
        `
        <h3> <strong>Använda sig av</strong></h3>
        <br>
        <p>${data.other_information}</p>
        <br>
        `
    }
    
    let preview = 
    `
    
    <div class="preview-modal modal fade" id="${modal_name}-${data.id}" tabindex="-1" aria-labelledby="${data.name}" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <i class="bi bi-x" data-bs-dismiss="modal" aria-label="Close"></i>
            </div>
            <div class="modal-body">
                <div class="preview relative">
                    <div class="container">
                        <div class="row" id="${data.id}">
                            
                            <div class="col-lg-12 mx-auto mb-20">
                                <img src="${data.image}" alt="${data.name}">
        
                                <div class="like"> 
                                        
                                        ${favourite}
                                </div>
        
                                <div class="links">
                                    <i class="bi bi-house-door-fill"></i>
                                    ${category}
                                    ${sub_category}
                                    ${subsub_category}
                                    
                                    
                                </div>
        
                                <div class="product">
                                    <div class="product-1">
                                        <h1>${data.name}</h1>
                                        <p>${data.weight}</p>
                                    </div>
        
                                  
                                </div>
        
        
                                ${product_information}
        
                                
                                ${origin}
                                 
                                <div class="product-discription">
                                    
                                    ${nutritional_content}
                                    ${storage}
                                    ${other_information}
                          
                                </div>
        
                            </div>
                        </div>
                        
                        <div class="buy-now sticky w-100" id="${data.id}">
                            <div class="buy-content">
                                <span>
                                    <h4 class="discount-price ">${preview_discount_price}:-</h4>
                                    <p> <span class="line-through  ${preview_price_hidden}"> <s> ${data.price} </s></span> <span>Jmf pris ${data.compare_price}:-</span></p>
                                </span>

                                <div class="card-counter-div card-counter d-flex" style="${(data.cart_quantity > 0) ? 'justify-content:space-between;background-color:rgb(232, 232, 232)' : 'justify-content:flex-end;background-color:white'} ">
                                    <a class="card-minus-div ${(data.cart_quantity > 0) ? '' : 'hidden'}"><i class="bi bi-dash-circle-fill minus"></i></a>
                                    <input type="number" class="st   ${(data.cart_quantity > 0) ? '' : 'hidden'} card-quantity-div" value="${data.cart_quantity}" size="2">
                                    <a class="card-plus-div ${(data.cart_quantity > 0) ? '' : 'hidden'} "><i class="bi bi-plus-circle-fill plus"></i></a>
                                    <button class="first-btn  ${(data.cart_quantity > 0) ? 'hidden' : ''}" >
                                        Köp
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
          </div>
        </div>
    </div>
    `
    
    
   
    return preview
}

function discountPrice(price){
    
    let cart_discount_card = document.getElementsByClassName("side-cart-discount")
    let cart_discount =  document.getElementById("cart-discount")
    
    if(cart_discount){
        
        if(price > 0){
             cart_discount_card[0].classList.remove('hidden');
             cart_discount.innerHTML = "SEK "+price 
        }else{
            cart_discount_card[0].classList.add('hidden');
            cart_discount.innerHTML = 0
        }
    }
}

function EmptyCart() {
    let cart = document.getElementById("cart-product");
    document.getElementById("p-bar").style.width = 0+"%";
    document.getElementById("p_message").innerHTML = "Handla för 1000:0 till";
    document.getElementsByClassName("side-cart-discount")[0].classList.add('hidden');
    TotalCartCount(0)
    $.ajax({
        url: "https://livsham.softwarebyte.co/api/cart/destroy",
        type: "DELETE",
       
        success: function (data) {
            cart.innerHTML = "";
            $("#staticBackdrop").modal("hide");
            GetCartProducts()

        }
    })
}

// -----------------search-bar-------------------- //

function Search(search) {
    
        $.ajax({
            url: "https://livsham.softwarebyte.co/api/search/"+search,
            type: "GET",
            // data: {
            //     "search": search
            // },
            success: function (data) {
                // data = JSON.parse(data);
                
                GetSessionData(data);
    
            }
        });
        
    
}


const inputElements = [...document.querySelectorAll('input.code-input')]
inputElements.forEach((ele,index)=>{
  ele.addEventListener('keydown',(e)=>{
    // if the keycode is backspace & the current field is empty
    // focus the input before the current. Then the event happens
    // which will clear the "before" input box.
    if(e.keyCode === 8 && e.target.value==='') inputElements[Math.max(0,index-1)].focus()
  })
  ele.addEventListener('input',(e)=>{
    // take the first character of the input
    // this actually breaks if you input an emoji like :man-woman-girl-boy:....
    // but I'm willing to overlook insane security code practices.
    const [first,...rest] = e.target.value
    e.target.value = first ?? '' // first will be undefined when backspace was entered, so set the input to ""
    const lastInputBox = index===inputElements.length-1
    const didInsertContent = first!==undefined
    if(didInsertContent && !lastInputBox) {
      // continue to input the rest of the string
      inputElements[index+1].focus()
      inputElements[index+1].value = rest.join('')
      inputElements[index+1].dispatchEvent(new Event('input'))
    }
  })
})


function GetPostCodeSession(){
    $.ajax({
        url: "https://livsham.softwarebyte.co/postcode",
        type: "GET",
        success: function(response){
            if(document.getElementById('post-number-btn')){
                
                if(response.length > 0){
                    document.getElementById('post-number-btn').innerHTML = "Hemleverans till : "+response+""
                    document.getElementById('reserve-time-btn').classList.remove('hidden')
                }else{
                    document.getElementById('post-number-btn').innerHTML = "Postnummer "
                }
            }
        }
    })
}

function sizeObj(obj) {
  return Object.keys(obj).length;
}

function GetDeliveryTimeSession(){
    $.ajax({
        url: "https://livsham.softwarebyte.co/deliverytime",
        type: "GET",
        success: function(response){
            if(document.getElementById('reserve-time-btn')){
                // console.log(response)
                if(sizeObj(response) > 0 ){
                    document.getElementById('reserve-time-btn').innerHTML = "Datum : "+response['delivery_date']+ "" +" Tid : "+ response['start_time'].substr(0,response['start_time'].length-3)+" - "+response['end_time'].substr(0,response['end_time'].length-3)
                }else{
                    document.getElementById('reserve-time-btn').innerHTML = "Reservera tid"
                }
            }
        }
    })
}

GetPostCodeSession()
GetDeliveryTimeSession()

function currentDates(){
    
    let date = new Date()
    let dates = [date]
    for (let i = 1; i < 31; i++) {
        const newDate = new Date(date.getFullYear(), date.getMonth(), date.getDate()+i)
        
        dates.push(newDate)
    }
    
    return dates
}


function minTwoDigits(n){
    return (n < 10 ? '0' : '') + n
}

let weekdays = new Array(7);
weekdays[0] = "Sunday";
weekdays[1] = "Monday";
weekdays[2] = "Tuesday";
weekdays[3] = "Wednesday";
weekdays[4] = "Thursday";
weekdays[5] = "Friday";
weekdays[6] = "Saturday";
let deliveryDates = document.getElementById("pills-tabs")
let deliveryTimes = document.getElementById("pills-tabContent")
let timeCardSlider = document.getElementsByClassName("time-card-slider")[0]
const dates = currentDates()
let deliverydate = ""
let deliverytime = ""
$.ajax({
    url: "https://livsham.softwarebyte.co/api/admin/deliverytime",
    type: "GET",
    success: function(response){
        let disabledfiltered = response.filter(item => (item.status == 0 && item.start_time == "00:00:00"))
        let disableddates = disabledfiltered.map(data => data.date)
        let disabledtimefiltered = response.filter(data => (data.status == 0 && data.start_time != "00:00:00"))
        let disabledtime = disabledtimefiltered.map(data => data.date+"/"+data.start_time+"-"+data.end_time)
        let disabledtimedate = disabledtimefiltered.map(data => (data.date))
        // console.log(disabledtime)
        for (let i = 0; i < dates.length; i++) {
            
            let dateformat = `${dates[i].getFullYear()}-${minTwoDigits(dates[i].getMonth()+1)}-${minTwoDigits(dates[i].getDate())}`
            let deliverydatadisabled = disableddates.includes(dateformat) ? 'disabled': ""
            // console.log(disableddates.includes(dateformat))
            let checked=''
            let hidden = ''
            if(i==0 ){
                checked = 'checked'
                hidden = 'hidden'
            }
            deliverydate +=
            `
            <li class="${hidden} nav-item swiper-slide time-slide" role="presentation">
                <label id="time-card-${weekdays[dates[i].getDay()]}-${dates[i].getDate()}-tab" data-bs-toggle="pill" data-bs-target="#time-card-${weekdays[dates[i].getDay()]}-${dates[i].getDate()}"
                    type="button" role="tab" aria-controls="pills-${weekdays[dates[i].getDay()]}-${dates[i].getDate()}" aria-selected="true">
                    <div class="item">
                        <label class="">
                            <input ${deliverydatadisabled} name="date" required class="radio" type="radio" value="${dates[i].getFullYear()}-${dates[i].getMonth()+1}-${dates[i].getDate()}" ${checked}>
        
                            <span class="plan-details select-day-card">
                                <span class="plan-type"></span>
                                <span class="plan-cost"></span>
                                <div class="select-day-date">
                                    <p>${weekdays[dates[i].getDay()]}</p>
                                    <h1>${dates[i].getDate()}</h1>
                                    <p>${dates[i].toLocaleString('default', { month: 'long' })}</p>
                                </div>
                            </span>
                        </label>
                    </div>
        
                </label>
        
            </li>
            `
            let active = ''
            if(i==1){
                active = 'active show'
            }
            
            
            deliverytime += 
            `
            
                <div class="${hidden} tab-pane fade ${active}" id="time-card-${weekdays[dates[i].getDay()]}-${dates[i].getDate()}" role="tabpanel" aria-labelledby="time-card-${weekdays[dates[i].getDay()]}-${dates[i].getDate()}-tab">
                    <div class="select-time">
                        <div class="select-day-time">
            
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="width: 100%;">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="pills-6-12-${i}-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-6-12-${i}" type="button" role="tab"
                                        aria-controls="pills-6-12-${i}" aria-selected="true">06:00 - 12:00</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-12-18-${i}-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-12-18-${i}" type="button" role="tab"
                                        aria-controls="pills-12-18-${i}" aria-selected="false">12:00 -
                                        18:00</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-18-23-${i}-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-18-23-${i}" type="button" role="tab"
                                        aria-controls="pills-18-23-${i}" aria-selected="false">18:00 -
                                        23:00</button>
                                </li>
                            </ul>
                            
                                <div class="tab-content w-100" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-6-12-${i}" role="tabpanel"
                                        aria-labelledby="pills-6-12-${i}-tab">
                                        <div class="select-time-slot">
                                            
                                                <div class="time-slot">
                                                    <label>
                                                        <div class="flex">
                                                            <input type="radio" name="time" class="time" id="${dateformat}/06:00:00-08:00:00" required value="6:00:00-8:00:00">
                                                            <p>6:00-8:00</p>
                                                            <span></span>
                                                            </div>
                                                        
                                                    </label>
                                                </div>
                
                                                <div class="time-slot">
                                                    <label>
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/08:00:00-10:00:00" required value="08:00:00-10:00:00">
                                                        <p>8:00-10:00</p>
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                
                                                <div class="time-slot">
                                                    <label>
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/10:00:00-12:00:00" required value="10:00:00-12:00:00">
                                                        <p>10:00-12:00</p>
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                            
                                        </div>
                                    </div>
                
                
                
                                    <div class="tab-pane fade" id="pills-12-18-${i}" role="tabpanel"
                                        aria-labelledby="pills-12-18-${i}-tab">
                                        <div class="select-time-slot">
                
                                            
                                                <div class="time-slot">
                                                
                                                    <label>
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/12:00:00-14:00:00" required value="12:00:00-14:00:00">
                                                        <p>12:00-14:00</p>
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                
                                                <div class="time-slot">
                                                    <label>
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/14:00:00-16:00:00" required value="14:00:00-16:00:00">
                                                        <p>14:00-16:00</p>
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                
                                                <div class="time-slot">
                                                    <label>
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/16:00:00-18:00:00" required value="16:00:00-18:00:00">
                                                        <p>16:00-18:00</p>
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                            
                                        </div>
                                    </div>
                                
                
                
                                    <div class="tab-pane fade" id="pills-18-23-${i}" role="tabpanel"
                                        aria-labelledby="pills-18-23-${i}-tab">
                                        <div class="select-time-slot">
                
                                            
                                                <div class="time-slot">
                                                
                                                    <label type="radio">
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/18:00:00-20:00:00" required value="18:00:00-20:00:00">
                                                        <p> 18:00-20:00</p>
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                
                                                <div class="time-slot">
                                                    <label>
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/20:00:00-22:00:00" required value="20:00:00-22:00:00">
                                                        <p>20:00-22:00</p>
                
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                                    
                                                <div class="time-slot">
                                                    <label>
                                                    <div class="flex">
                                                        <input type="radio" name="time" class="time" id="${dateformat}/22:00:00-24:00:00" required value="22:00:00-24:00:00">
                                                        <p>22:00-24:00</p>
                
                                                        <span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                            
                                        </div>
                                    </div>
                
                
                                </div>
                            
            
                        </div>
                    </div>
                </div>
        
            `
               
      
       

        }
        
       
        if(deliveryDates){
            deliveryDates.innerHTML = deliverydate
        }
        
        if(deliveryTimes){
            deliveryTimes.innerHTML = deliverytime
        }
        let timeRanges = document.getElementsByClassName("time")
        const currentDateTime = new Date();
        // console.log(disabledtime)
        for (let i = 0; i < timeRanges.length; i++) {
            const timeRange = timeRanges[i]
            const timedate = timeRange.id
            const check = disabledtime.includes(timedate)
            
            if(check){
                timeRange.setAttribute("disabled", ""); 
                const div = document.createElement("div")
                div.innerHTML = "inte tillgänglig"
                timeRange.parentElement.parentElement.appendChild(div)
            }
            // const timedate = timeRange.id.split('/')
            // const timeRangeArray = timedate[1].split('-')
            // const date = timedate[0]
            // const start_time = timeRangeArray[0]
            // const end_time = timeRangeArray[1]
            // // console.log(disabledtimedate.includes(date))
            // if(disabledtimedate.includes(date)){
            //     console.log(start_time+end_time)
                
            //     console.log(disabledtime.includes(start_time+end_time))
            //     if(disabledtime.includes(start_time+"-"+end_time)){
                    
            //         console.log(timeRange)
            //     }
            // }
            // console.log(timeRange)
            // timeRange.innerHTML = (timeRange.innerHTML == "Disable") ? "Enable" : "Disable"
        
        }

        
        
        
    }
})

  

function ToggleDate(date, start_time="00:00:00", end_time="24:00:00"){
    let temp = null
    $.ajax({
        url: "https://livsham.softwarebyte.co/admin/deliverytime/store",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
        type: "POST",
        data: {
          "date":date,
          "start_time":start_time,
          "end_time":end_time
        },
        
        success: function(response){
            // console.log(response)
            temp = response
        }
    })
    return temp
}


function myFunction() {
    var dots = document.getElementById("dots");
    var moreText = document.getElementById("more");
    var btnText = document.getElementById("myBtn");
  
    if (dots.style.display === "none") {
      dots.style.display = "inline";
      btnText.innerHTML = "view shopping cart"; 
      moreText.style.display = "none";
    } else {
      dots.style.display = "none";
      btnText.innerHTML = "view shopping cart"; 
      moreText.style.display = "inline";
    }
  }
  function B_myFunction() {
    var dots = document.getElementById("dots2");
    var moreText2 = document.getElementById("more2");
    var btnText2 = document.getElementById("myBtn2");
  
    if (dots.style.display === "none") {
      dots.style.display = "inline";
      btnText2.innerHTML = ""; 
      moreText2.style.display = "none";
      RemoveOrderMessage()
    } else {
      dots.style.display = "none";
      btnText2.innerHTML = ""; 
      moreText2.style.display = "inline";
    }
  }
  function C_myFunction() {
    var dots = document.getElementById("dots3");
    var moreText3 = document.getElementById("more3");
    var btnText3 = document.getElementById("myBtn3");
  
    if (dots.style.display === "none") {
      dots.style.display = "inline";
      btnText3.innerHTML = ""; 
      moreText3.style.display = "none";
      RemoveRecurringDelivery()
    } else {
      dots.style.display = "none";
      btnText3.innerHTML = ""; 
      moreText3.style.display = "inline";
    }
  }

function RecurringDelivery(cycle = 'every_week'){
    
    $.ajax({
        url: "https://livsham.softwarebyte.co/orders/recurring_delivery",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
        type: "POST",
        
        data: {
          "cycle":cycle,
        },
        success: function(response){
            // console.log(response)
           
        }
    })
}

function RemoveRecurringDelivery(){
    
    $.ajax({
        url: "https://livsham.softwarebyte.co/orders/recurring_delivery/remove",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
        type: "POST",
        
        
        success: function(response){
            // console.log(response)
           
        }
    })
}
function OrderMessage(message){
    
    $.ajax({
        url: "https://livsham.softwarebyte.co/orders/message",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
        type: "POST",
        data: {
          "message":message,
        },
        success: function(response){
        
        }
    })
}
function RemoveOrderMessage(){
    $.ajax({
        url: "https://livsham.softwarebyte.co/orders/message/remove",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
        type: "POST",
        
        success: function(response){
        
        }
    })
}
function OrderLeaveOutside(){
    
    $.ajax({
        url: "https://livsham.softwarebyte.co/orders/leave_outside",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
           
        
        type: "POST",
        
        
        success: function(response){
            // console.log(response)
           
        }
    })
}



function RemoveOrderLeaveOutside(){
    $.ajax({
        url: "https://livsham.softwarebyte.co/orders/leave_outside/remove",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
           
        
        type: "POST",
        
        success: function(response){
            
           
        }
    })
}

function validate_coupon(coupon_code){
    $.ajax({
        url: "https://livsham.softwarebyte.co/validate_coupon",
        headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           },
           
        data: {
          "code":coupon_code,
        },
        
           
        
        type: "POST",
        
        
        success: function(response){
            if(response == 404){
                 const error = document.getElementById('error')
                 
                 error.innerHTML = "NOT A VALID COUPON"
                 
                 
            }else{
                const total = parseFloat(((document.getElementById('total').innerHTML).replace('SEK ','')).replace(':','.'))
                // console.log(total)
                // console.log((response.amount))
                 const error = document.getElementById('error')
                    
                if(total > response.amount){
                    // console.log('success')
                    
                     
                     error.innerHTML = ""
                }else{
                    error.innerHTML = "Coupon amount must be lesser than the total amount"
                }
            }
           
        }
    })
}

const coupon = document.getElementById('coupon')
if(coupon){
coupon.addEventListener('change', function(){
    validate_coupon(coupon.value)
})
}
const checkout_recurring_delivery = document.getElementById('checkout_recurring_delivery')
if(checkout_recurring_delivery){
    const weekly =  document.getElementById('every_week')
    const biweekly = document.getElementById('bi_weekly')
    
    weekly.addEventListener('click', function(){
       
        RecurringDelivery('every_week')
        UpdateKlarnaToSubscription("WEEK", 1)
    })
    biweekly.addEventListener('click', function(){
        
        RecurringDelivery('bi_weekly')
        
        UpdateKlarnaToSubscription("WEEK", 2)
    })
}





// const checkout_recurring_delivery_btn = document.getElementsByClassName('checkout_recurring_delivery_toggle')
// if(checkout_recurring_delivery_btn){
    
//     const checkout_recurring_delivery = document.getElementById('checkout_recurring_delivery')
// }

const checkout_message_toggle = document.getElementsByClassName('checkout_message_toggle')[0]
if(checkout_message_toggle){
    const checkout_message = document.getElementById('checkout_message')
    checkout_message.addEventListener('change' , function(){
        OrderMessage(checkout_message.value)
    })
}
// 
const checkout_leave_outside = document.getElementById('checkout_leave_outside')

if(checkout_leave_outside){
checkout_leave_outside.addEventListener('change', function(){
    if ($("#checkout_leave_outside").is(":visible")) { 
      OrderLeaveOutside()
    } else {
      RemoveOrderLeaveOutside()
    }
})
}
let currentRequest = null
function GetSessionData(data) {
    let search_dropdown = $("#drop-down-box");
    
    currentRequest = $.ajax({
        url: "https://livsham.softwarebyte.co/api/cart/session",
        type: "GET",
        beforeSend : function()    {           
                if(currentRequest != null) {
                    currentRequest.abort();
                }
            },
        success: function (new_data) {
            // new_data = JSON.parse(response);
            let totalquantity=0
             let searchPreview = document.getElementById('search-preview-cards')
             if(searchPreview){
                
             }
              searchPreview.innerHTML = "";
            for (let i = 0; i < data.length; i++) {
                
                
                
                let div = document.createElement("div");
                div.classList.add("custom-row", "row");
                div.style = " --bs-gutter-x: 0!important;";
                div.id = data[i].id;
                let div1 = document.createElement("div");
                div1.classList.add("col-2", "p-2");
                let img = document.createElement("img");
                img.src = data[i].image;
                img.classList.add("w-full", "search-img");
                div1.appendChild(img);
                div.appendChild(div1);
                let div2 = document.createElement("div");
                div2.classList.add("col-6");
                let h4 = document.createElement("h4");
                h4.classList.add("text-dark", "text-lg", "pt-2", "text-primary", "cursor-pointer");
                h4.setAttribute('data-bs-toggle', 'modal')
                h4.setAttribute('data-bs-target', '#search-'+data[i].id)
                h4.innerHTML = data[i].name;
                div2.appendChild(h4);
                let p = document.createElement("p");
                p.classList.add("text-sm");
                let a1 = document.createElement("a")
                let a2 = document.createElement("a")
                let a3 = document.createElement("a")
                a1.href="https://livsham.softwarebyte.co/product/category?category="+data[i].category_id
                a1.innerHTML = data[i].category +" /"
                a2.href="https://livsham.softwarebyte.co/product/sub_cat/"+data[i].sub_category_id
                a2.innerHTML = data[i].sub_category +" /"
                a3.href="https://livsham.softwarebyte.co/product/subsub_cat/"+data[i].subsub_category_id
                a3.innerHTML = data[i].subsub_category
                
                p.appendChild(a1)
                p.appendChild(a2)
                p.appendChild(a3)
                let p1 = document.createElement("p");
                p1.classList.add("text-sm", "font-bold");
                p1.innerHTML = data[i].price+":-";
                div2.appendChild(p);
                div2.appendChild(p1);
                div.appendChild(div2);
                let div3 = document.createElement("div");
                div3.classList.add("col-4", "d-flex", "justify-content-end", "pe-1");
                let div4 = document.createElement("div");
                div4.classList.add("mt-4", "row", "justify-content-center");
                let button = document.createElement("button");
                let input = document.createElement("input");
                let button1 = document.createElement("button");
                button.addEventListener("click", function (e) {
                    e.preventDefault();
                    RemoveQuantity(this);

                })
                button1.addEventListener("click", function (e) {
                    e.preventDefault();
                    AddQuantity(this);
                })
                input.readOnly = true;
                let i1 = document.createElement("i");
                let i2 = document.createElement("i");
                i1.classList.add("fas", "fa-plus");
                i2.classList.add("fas", "fa-minus");
                array = isInArray(data[i].id, new_data)
                if (array != false) {
                    button.classList.add("ms-0", "btn", "btn-secondary", "btn-sm", "rounded-circle", "quantity");
                    input.classList.add("form-control", "form-control-sm", "w-25", "text-center", "quantity");
                    button1.classList.add("btn", "btn-success", "btn-sm", "rounded-circle", "quantity", "plus");
                    input.value = array;
                    totalquantity = totalquantity + array
                } else {
                    button.classList.add("ms-0", "btn", "btn-secondary", "btn-sm", "rounded-circle", "quantity", "custom-d-none");
                    input.classList.add("form-control", "form-control-sm", "w-25", "text-center", "quantity", "custom-d-none");
                    button1.classList.add("btn", "btn-success", "btn-sm", "rounded-circle", "quantity", "plus");
                    input.value = 0;
                    
                }
                TotalCartCount(totalquantity)

                button1.appendChild(i1);
                button.appendChild(i2);
                div4.appendChild(button);
                div4.appendChild(input);
                div4.appendChild(button1);
                div3.appendChild(div4);
                div.appendChild(div3);
                let hr = document.createElement("hr");
                div.appendChild(hr);
                search_dropdown.append(div);
                let preview_discount_price = (data[i].discount_price > 0) ? data[i].discount_price : data[i].price
                let preview_price_hidden = (data[i].discount_price <= 0) ? "hidden" : ""
                let preview_price = (data[i].discount_price <= 0) ? data[i].price : data[i].price
                let origin = ''
                if(data[i].origin){
                    origin = `<div class="product-country">
                                <i class="bi bi-globe"></i>
    
                                <div class="country-info">
                                    <p>Ursprung</p>
                                    <h3>${data[i].origin}</h3>
                                </div>
                            </div>`
                }
                let preview = 
                `
                
                <div class="preview-modal modal fade" id="search-${data[i].id}" tabindex="-1" aria-labelledby="${data[i].name}" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                      <div class="modal-content">
                        <div class="modal-header">
                          <i class="bi bi-x" data-bs-dismiss="modal" aria-label="Close"></i>
                        </div>
                        <div class="modal-body">
                            <div class="preview relative">
                                <div class="container">
                                    <div class="row" id="${data[i].id}">
                                        
                                        <div class="col-lg-12 mx-auto mb-20">
                                            <img src="${data[i].image}" alt="${data[i].name}">
                    
                                            <!--<div class="like"> -->
                                            <!--         @if(auth()->user())-->
                                            <!--            @if(auth()->user()->is_favourite($item->id))-->
                                            <!--                <i id="likebtn" class="bi bi-heart-fill likebtn" style="color: red;"></i>-->
                                                            
                                            <!--            @else-->
                                                        
                                            <!--                <i id="likebtn" class="bi bi-heart-fill likebtn"></i>-->
                                            <!--            @endif-->
                                            <!--        @else-->
                                                    
                                            <!--        <i id="likebtn" class="bi bi-heart-fill likebtn"></i>-->
                                            <!--        @endif-->
                                            <!--</div>-->
                    
                                            <div class="links">
                                                <i class="bi bi-house-door-fill"></i>
                                                
                                                <h4><a href="https://livsham.softwarebyte.co/product/category?category=${data[i].category_id}"> ${data[i].category} </a>/ </h4>
                                    
                                                <h4><a href="https://livsham.softwarebyte.co/product/sub_cat/${data[i].sub_category_id}"> ${data[i].sub_category} </a> / </h4>
                                     
                                                <h4><a href="https://livsham.softwarebyte.co/product/subsub_cat/${data[i].subsub_category_id}"> ${data[i].subsub_category} </a> / </h4>
                                                <h4> ${data[i].name}</h4>
                                                
                                            </div>
                    
                                            <div class="product">
                                                <div class="product-1">
                                                    <h1>${data[i].name}</h1>
                                                    <p>${data[i].weight}</p>
                                                </div>
                    
                                              
                                            </div>
                    
                    
                                            <div class="accordion accordion-flush" id="accordionFlushExample" style="width: 100%;">
                                                <div class="accordion-item">
                                                    <h2 class="accordion-header" id="flush-headingOne">
                                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                                            data-bs-target="#flush-collapseOne" aria-expanded="false"
                                                            aria-controls="flush-collapseOne">
                                                            Produktinformation
                                                        </button>
                                                    </h2>
                                                    <div style="visibility: visible;" id="flush-collapseOne"
                                                        class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                                                        data-bs-parent="#accordionFlushExample">
                                                        <div class="accordion-body">${data[i].product_information}</div>
                                                    </div>
                                                </div>
                                            </div>
                    
                                            
                                            ${origin}
                                             
                                            <div class="product-discription">
                                                
                                                <h3> <strong> Näringsinnehåll</strong></h3>
                                                <br>
                                                <p>${data[i].nutritional_content}</p>
                                                <br>
                                                <h3> <strong>Lagring</strong></h3>
                                                <br>
                                                <p>${data[i].storage}</p>
                                                <br>
                                                <h3> <strong>Använda sig av</strong></h3>
                                                <br>
                                                <p>${data[i].other_information}</p>
                                                <br>
                                      
                                            </div>
                    
                                        </div>
                                    </div>
                                    
                                    <div class="buy-now sticky w-100" id="${data[i].id}">
                                        <div class="buy-content">
                                            <span>
                                                <h4 class="discount-price ">${preview_discount_price}:-</h4>
                                                <p> <span class="line-through  ${preview_price_hidden}"> <s> ${data[i].price} </s></span> <span>Jmf pris ${data[i].compare_price}:-</span></p>
                                            </span>
            
                                            <div class="card-counter d-flex">
                                                <a><i class="bi bi-dash-circle-fill minus"></i></a>
                                                <input type="number" class="st" value="0" size="2">
                                                <a><i class="bi bi-plus-circle-fill plus"></i></a>
            
                                                <button class="first-btn">
                                                    Köp
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                      </div>
                    </div>
                </div>
                `
                let searchPreview = document.getElementById('search-preview-cards')
                if(searchPreview){
                    searchPreview.innerHTML += preview
                }
                let previewCounter  = document.getElementById('search-'+data[i].id)
                        if(previewCounter){
                            const element = previewCounter.getElementsByClassName('card-counter')[0]
                            const minusParent = element.querySelectorAll('a')[0]
                            const plusParent = element.querySelectorAll('a')[1]
                            const minus = element.getElementsByClassName('minus')[0]
                            const plus = element.getElementsByClassName('plus')[0]
                            const st = element.getElementsByClassName('st')[0]
                            const firstbtn = element.getElementsByClassName('first-btn')[0]
                            
                            minus.style.display = 'none' 
                            st.style.display = 'none'
                            // firstbtn.style.display = 'none'
                            plus.style.display = 'none'
                            element.style.backgroundColor = 'white' 
                        
                            if(firstbtn){
                                firstbtn.addEventListener('click', (e)=>{
                                    
                                    st.value = parseInt(st.value) + 1
                                    debounce(AddQuantity(firstbtn))
                                    if(minus.style.display == 'none'){
                                        minus.style.display = 'block'
                                        firstbtn.style.display = 'none'
                                        element.style.backgroundColor = 'rgb(232, 232, 232)'
                                        plus.style.display = 'block'
                        
                                    }
                                    if(st.style.display == 'none'){
                                        st.style.display = 'block'
                                    }   
                                })
                        
                                
                            }   
                        
                        
                            if(minusParent){
                                minusParent.addEventListener('click', (e)=>{
                                    
                                    if(st.value < 2){
                                        st.value = 0
                                        
                                        debounce(RemoveQuantity(minusParent));
                                        minus.style.display = 'none' 
                                        st.style.display = 'none' 
                                        element.style.backgroundColor = 'white'
                                        firstbtn.style.display = 'block'
                                        plus.style.display = 'none'
                                    }else{
                                        debounce(RemoveQuantity(minusParent));
                                    }
                                })
                        
                                
                            }   
                            if(plusParent){
                                plusParent.addEventListener('click', (e)=>{
                                    st.value = parseInt(st.value) + 1
                                    debounce(AddQuantity(plusParent))
                                    if(minus.style.display == 'none'){
                                        minus.style.display = 'block'
                                        element.style.backgroundColor = 'rgb(232, 232, 232)'
                                    }
                                    if(st.style.display == 'none'){
                                        st.style.display = 'block'
                                    }
                                })
                            }
                            
                        }
            }
            search_dropdown.show();
            
            

        }
    });
    
}





function TotalCartPrice(price){
    let cartItemBtnPrices = document.getElementsByClassName('cart-total-price-overview')
    for (let i = 0; i < cartItemBtnPrices.length; i++) {
        const cartItemBtnPrice = cartItemBtnPrices[i];
        if(price <= 0){
            cartItemBtnPrice.classList.add('hidden')
        }else{
            cartItemBtnPrice.classList.remove('hidden')
            cartItemBtnPrice.innerHTML = price + " SEK"
        }
    }
    
}
function TotalCartCount(qty){
    cartItemBtns = document.getElementsByClassName('cart-item-amount')
    
    cartItemTotalCount = document.getElementById('cart-items-count')
    
    for (let i = 0; i < cartItemBtns.length; i++) {
        const cartItemBtn = cartItemBtns[i];
        if(qty <= 0){
            cartItemBtn.classList.add('hidden')
        }else{
            
            cartItemBtn.classList.remove('hidden')
            cartItemBtn.innerHTML = qty
            
        }
        
    }
    
    if(cartItemTotalCount){
        if(qty <= 0){
            cartItemTotalCount.innerHTML = 0
        }else{
            
            cartItemTotalCount.innerHTML = qty
            
        }
    }
    
}

function isInArray(value, array) {
    if (array.length == 0) {
        return false;
    } else {
        for (let i = 0; i < array.length; i++) {
          
            if (array[i][0] === value) {
                return array[i][1];
            } 
        }
    }
    return false
}

$(document).ready(function () {
    GetProducts();
    GetCartProducts();
    let search_dropdown = $("#drop-down-box");
    $(document).on('click', function (event) {
        if (!search_dropdown.is(event.target) && search_dropdown.has(event.target).length === 0) {
            search_dropdown.hide();
            lightbg()
        }
    });

    $("#SearchInput").on("input", debounce(function () {
        let search = $(this).val().toLowerCase();
        if (search.length == 0) {
            search_dropdown.hide();
            
            
        } else {
            search_dropdown.empty();
            Search(search)
            
        }
    }));

})
cardCounter()

let owlCarousel =  $('.card-slides ').owlCarousel({
            loop: false,
            margin: 10,
            autoplay: false,
            autoHeight: true,
            nav: true,
            dots: false,
            responsive: {
                0: {
                    items: 2
                },
                576: {
                    items: 3
                },
                767:{
                    items: 3
                },
                1200:{
                    items: 4
                },
                1400:{
                    items: 6
                },
            }
        })
        
        
const categoriesPageItems = document.getElementsByClassName('category-page-items')[0]

if(categoriesPageItems){
    $.ajax({
    url: "https://livsham.softwarebyte.co/api/category/5",
    type: "GET",
    
    success: function (new_data) {
        new_data.forEach((item, index)=>{
        	
        	    let cardContent = card(item, 'data')
        	    let cardModal = previewModel(item, 'data')
        	    
                // console.log(cardContent)
                categoriesPageItems.innerHTML += cardContent;
                
        	
        })
    }
    })
}

const homeExtrapriser = document.getElementById('home-extrapriser')
const homeAll = document.getElementById('home-all')
const owl = document.getElementsByClassName('card-slides')
console.log(homeExtrapriser)
if(homeExtrapriser){
    $.ajax({
    url: "https://livsham.softwarebyte.co/api/home",
    type: "GET",
    
    success: function (new_data) {
        // console.log(new_data)
        // let allContent = 
        new_data.forEach((item, index)=>{
        	if(item.discount_price > 0){
        	    let cardContent = card(item, 'extra', 'col-lg-12 col-md-12 col-sm-12', true)
        	    
                const owl =  $('.card-slides').trigger('add.owl.carousel', [cardContent])
        	    let cardModal = previewModel(item, 'extra')
                
                
        	}
        })
        owlCarousel.trigger('refresh.owl.carousel')
        new_data.forEach((item, index)=>{
        	
        	    let cardContent = card(item, 'data')
        	    let cardModal = previewModel(item, 'data')
        	    
                // console.log(cardContent)
                homeAll.innerHTML += cardContent;
                
        	
        })
        
        
        // ---------------load more--------------
        
        $(document).ready(function(){
            $(".card-box").slice(0, 18).show();
            $("#loadMore").on("click", function(e){
              e.preventDefault();
              $(".card-box:hidden").slice(0, 12).slideDown();
              if($(".card-box:hidden").length == 0) {
                $("#loadMore").css("display", "none");
              }
            });
            
          })
    }})
            
}

    
const Mainbody = document.getElementById('body')
console.log(Mainbody)
if(Mainbody){
        
    Mainbody.addEventListener('click', function(e){
        console.log(e.target)
        console.log(e.target.className == 'bi bi-dash-circle-fill minus')
        if(e.target && e.target.className == 'bi bi-dash-circle-fill minus'){
            let parentElement = e.target.parentElement.parentElement
            let quantity = parentElement.getElementsByClassName('card-quantity-div')[0]
            
            let minus = e.target.parentElement
            let plus = parentElement.getElementsByClassName('card-plus-div')[0]
            let firstbtn = parentElement.getElementsByClassName('first-btn')[0]
            if(quantity.value < 2){
                quantity.value = 0
                RemoveQuantity(minus)
                minus.classList.add('hidden')
                quantity.classList.add('hidden')
                plus.classList.add('hidden')
                firstbtn.classList.remove('hidden')
                console.log(parentElement)
                parentElement.style.backgroundColor = 'white'
                parentElement.style.justifyContent = 'flex-end'
                
            }else{
                    RemoveQuantity(minus);
            }
            
            
        }else if(e.target && e.target.className == 'bi bi-plus-circle-fill plus'){
            
            let parentElement = e.target.parentElement.parentElement
            let quantity = parentElement.getElementsByClassName('card-quantity-div')[0]
            
            let plus = e.target.parentElement
            let minus = parentElement.getElementsByClassName('card-minus-div')[0]
            let firstbtn = parentElement.getElementsByClassName('first-btn')[0]
            console.log(minus)
            console.log(plus)
            console.log(firstbtn)
            quantity.value = parseInt(quantity.value) + 1
            
            parentElement.style.justifyContent = 'space-between'
                AddQuantity(plus)
                if(minus.classList.contains('hidden')){
                    minus.classList.remove('hidden')
                    parentElement.style.backgroundColor = 'rgb(232, 232, 232)'
                }
                if(quantity.classList.contains('hidden')){
                    quantity.classList.remove('hidden')
                }
        }else if(e.target && e.target.className == 'first-btn'){
            
                let parentElement = e.target.parentElement
                let quantity = parentElement.getElementsByClassName('card-quantity-div')[0]
                console.log(quantity)
                // console.log(parentElement)
                let firstbtn = e.target
                let plus = parentElement.getElementsByClassName('card-plus-div')[0]
                let minus = parentElement.getElementsByClassName('card-minus-div')[0]
                
                parentElement.style.justifyContent = 'space-between'
                quantity.value = 1
                console.log(quantity)
                AddQuantity(plus)
                if(minus.classList.contains('hidden')){
                    minus.classList.remove('hidden')
                    firstbtn.classList.add('hidden')
                    parentElement.style.backgroundColor = 'rgb(232, 232, 232)'
                    plus.classList.remove('hidden')
    
                }
                if(quantity.classList.contains('hidden')){
                    quantity.classList.remove('hidden')
                }   
        }else if(e.target && e.target.id == 'likebtn'){
            // ---------like-btn favourite---------
            var likeBtn = e.target
            
            // for (let i = 0; i < likeBtns.length; i++) {
            //     const likeBtn = likeBtns[i];
                const product =likeBtn.parentNode.parentNode.parentNode
                const product_id = product.id
                    if (likeBtn.style.color =="red") {
                         likeBtn.style.color = "#E0E0E0"
                         $.ajax({
                            url: "https://livsham.softwarebyte.co/api/favourites/delete/"+product_id,
                            type: "GET",
                            data: {
                            },
                            success: function (data) {
                                if(data == 401){
                                    
                                    window.location.replace("https://livsham.softwarebyte.co/login");
                                }else{
                                // console.log(data)
                                }
                                
                            },
                            error: function (){
                                window.location.replace("https://livsham.softwarebyte.co/login");
                            }
                         })
                     }
                     else{
                         $.ajax({
                            url: "https://livsham.softwarebyte.co/api/favourites/store/"+product_id,
                            type: "GET",
                            data: {},
                            success: function (data) {
                                // console.log(data)
                                if(data == 401){
                                    window.location.replace("https://livsham.softwarebyte.co/login");
                                }else{
                                // console.log(data)
                                }
                            },
                            error: function (){
                                window.location.replace("https://livsham.softwarebyte.co/login");
                            }
                         })
                         likeBtn.style.color = "red"
                     }
                
            
        }
    })
}





