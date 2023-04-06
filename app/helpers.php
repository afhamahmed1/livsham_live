<?php

if ($_POST['function'] == "search") {
    search();
} elseif ($_POST['function'] == "AddtoCart") {
    AddtoCart();
} elseif ($_POST['function'] == "GetCartProducts") {
    GetCartProducts();
} elseif ($_POST['function'] == "EmptyCart") {
    EmptyCart();
} elseif ($_POST['function'] == "Checkout") {
    Checkout();
} elseif ($_POST['function'] == "GetQuantity") {
    GetQuantity();
} elseif ($_POST['function'] == "GetSession") {
    GetSession();
} elseif ($_POST['function'] == "GetProducts") {
    GetProducts();
}


if(!function_exists("search")){
    
    function search()
    {
        $search = $_POST['search'];
        // Load the JSON data from a file or a variable
    
        
        // $jsonData = file_get_contents('products.json');
        $jsonData = file_get_contents("https://livsham.softwarebyte.co/api/products");
        // Decode the JSON data into an array
        $data = json_decode($jsonData, true);
        // Loop through the array
        $results = array();
        foreach ($data['data'][0] as $key => $value) {
            if (strpos(strtolower($value['name']), strtolower($search)) !== false) {
                array_push($results, $value);
            }
        }
        // Return the search results as JSON
        echo json_encode($results);
    }


}





if(!function_exists("AddtoCart")){
    
    function AddtoCart()
    {
        session_start();
        $product_id = $_POST['id'];
        $qty = $_POST['qty'];
        $array = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        if (isset($_SESSION['cart'][$product_id])) {
            if ($qty == 0) {
                unset($_SESSION['cart'][$product_id]);
            } else {
                $_SESSION['cart'][$product_id] = $qty;
            }
        }
        
    }

}

if(!function_exists("GetCartProducts")){
    function GetCartProducts()
    {
        session_start();
        // $jsonData = file_get_contents('products.json');
        $jsonData = file_get_contents("https://livsham.softwarebyte.co/api/products");
        $data = json_decode($jsonData, true);
        $results = array();
        $product_details = array();
        $product_categories = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        } else {
            foreach ($_SESSION['cart'] as $key => $value) {
                foreach ($data['data'][0] as $key2 => $value2) {
                    if ($key == $value2['id']) {
                        $category = $value2['category'];
                        if (!isset($product_details[$category])) {
                            $product_details[$category] = array();
                            array_push($product_categories, $category);
                        }
                        $value2['qty'] = $_SESSION['cart'][$key];
                        array_push($product_details[$category], $value2);
                    }
                }
            }
            $results[0] = $product_categories;
            $results[1] = $product_details;
        }
        if (empty($results)) {
            $results = array('status' => 'error', 'message' => 'No Products in Cart');
        }
        echo json_encode($results);
    }
}


if(!function_exists("EmptyCart")){
    function EmptyCart()
    {
        session_start();
        unset($_SESSION['cart']);
    }
}

if(!function_exists("Checkout")){
    function Checkout()
    {
        include 'db_connection.php';
        session_start();
        // $jsonData = file_get_contents('products.json');
        
        $jsonData = file_get_contents("https://livsham.softwarebyte.co/api/products");
        $data = json_decode($jsonData, true);
        $result = array();
        $total = 0;
        foreach ($_SESSION['cart'] as $key => $value) {
            foreach ($data['data'][0] as $key2 => $value2) {
                if ($key == $value2['id']) {
                    $array = array();
                    $qty = $_SESSION['cart'][$key];
                    $price = substr(strval($value2['price']), 0, 2);
                    array_push($array, $qty);
                    array_push($array, $price);
                    array_push($array, $value2['id']);
                    $total = $total + (intval($price) * $qty);
                    array_push($result, $array);
                }
            }
        }
        $sql = "INSERT INTO `order`(`total`) VALUES ('$total')";
        if ($conn->query($sql)) {
            $order_id = $conn->insert_id;
            foreach ($result as $key => $value) {
                $sql = "INSERT INTO `order_details`(`product_id`, `product_qty`, `product_price`, `cart_id`) VALUES ('$value[2]','$value[0]','$value[1]','$order_id')";
                if (!$conn->query($sql)) {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
            }
            unset($_SESSION['cart']);
            echo json_encode(array('status' => 'success', 'message' => 'Order Placed Successfully'));
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    
    
    }
}

if(!function_exists("GetQuantity")){
    function GetQuantity()
    {
        session_start();
        $id= $_POST['id'];
        $array = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        if (isset($_SESSION['cart'][$id])) {
            $qty=intval($_SESSION['cart'][$id]) + 1;
            $_SESSION['cart'][$id] = $qty;
            array_push($array, $qty);
        } else {
            $_SESSION['cart'][$id] = 1;
            array_push($array, 1);
        }
        echo json_encode($array);
    }
}


if(!function_exists("GetSession")){

    function GetSession()
    {
        session_start();
        $array = array();
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = array();
        }
        foreach ($_SESSION['cart'] as $key => $value) {
            $new_array = array();
            array_push($new_array, $key);
            array_push($new_array, $value);
            array_push($array, $new_array);
        }
        echo json_encode($array);
    }
}

if(!function_exists("GetProducts")){

    function GetProducts(){
        $jsonData = file_get_contents('products.json');
        $data = json_decode($jsonData, true);
        $results = array();
        foreach ($data['data'][0] as $key => $value) {
            array_push($results, $value);
        }
        echo json_encode($results);
    }
}

?>