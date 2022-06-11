<?php

include "db.php";
session_start();

function addToCart($product_item){

    //SESSION
    /**
     * products
     *      Kedi Maması.....2.....100....200
     *      Köpek Maması.....2.....100....200
     * summary
     *      2 adet ürün.....400
     */
     if(isset($_SESSION["shoppingCart"])){

        $shoppingCart = $_SESSION["shoppingCart"];
        $products = $shoppingCart["products"];
        
     }else{
        $products = array();
     }
     
     //Adet kontrolü
     if(array_key_exists($product_item->urun_id, $products)){
        $products[$product_item->urun_id]->count++;
        
     }else{
        $products[$product_item->urun_id] = $product_item;
     }

     // Sepetin Hesaplanması

     $total_price = 0.0;
     $total_count = 0;

     foreach($products as $product){
         $product->total_price = $product->count * $product->satis_fiyat;
         $total_price += $product->total_price;
         $total_count += $product->count;
     }

     $summary["total_price"] = $total_price;
     $summary["total_count"] = $total_count;

     $_SESSION["shoppingCart"]["products"] = $products;
     $_SESSION["shoppingCart"]["summary"] = $summary;

     return $total_count;
}

function removeFromCart($product_id){

    if(isset($_SESSION["shoppingCart"])){

        $shoppingCart = $_SESSION["shoppingCart"];
        $products = $shoppingCart["products"];

        // Ürünü listeden çıkar
        if(array_key_exists($product_id, $products)){
            unset($products[$product_id]);
        }

        // Tekrardan sepeti hesapla
        $total_price = 0.0;
        $total_count = 0;

        foreach($products as $product){
            $product->total_price = $product->count * $product->satis_fiyat;
            $total_price += $product->total_price;
            $total_count += $product->count;
        }

        $summary["total_price"] = $total_price;
        $summary["total_count"] = $total_count;

        $_SESSION["shoppingCart"]["products"] = $products;
        $_SESSION["shoppingCart"]["summary"] = $summary;

        return true;
     }
    
}
function incCount($product_id){

    if(isset($_SESSION["shoppingCart"])){

        $shoppingCart = $_SESSION["shoppingCart"];
        $products = $shoppingCart["products"];

        if(array_key_exists($product_id, $products)){
            $products[$product_id]->count++;
        }

        // Sepetin Hesaplanması

        $total_price = 0.0;
        $total_count = 0;

        foreach($products as $product){
            $product->total_price = $product->count * $product->satis_fiyat;
            $total_price += $product->total_price;
            $total_count += $product->count;
        }

        $summary["total_price"] = $total_price;
        $summary["total_count"] = $total_count;

        $_SESSION["shoppingCart"]["products"] = $products;
        $_SESSION["shoppingCart"]["summary"] = $summary;

        return true;
     }

     //Adet kontrolü

     

}
function decCount($product_id){
    if(isset($_SESSION["shoppingCart"])){

        $shoppingCart = $_SESSION["shoppingCart"];
        $products = $shoppingCart["products"];
     }

     //Adet kontrolü

     if(array_key_exists($product_id, $products)){
         $products[$product_id]->count--;
     }if($products[$product_id]->count <= 0){
        unset($products[$product_id]);
        }

     // Sepetin Hesaplanması

     $total_price = 0.0;
     $total_count = 0;

     foreach($products as $product){
         $product->total_price = $product->count * $product->satis_fiyat;
         $total_price += $product->total_price; 
         $total_count += $product->count;
     }

     $summary["total_price"] = $total_price;
     $summary["total_count"] = $total_count;

     $_SESSION["shoppingCart"]["products"] = $products;
     $_SESSION["shoppingCart"]["summary"] = $summary;

     return true;
}

if(isset($_POST["p"])){
    $islem = $_POST["p"];
    if($islem == "addToCart"){
        $id = $_POST["product_id"];

        $product = $db->query("SELECT * FROM urunler WHERE urun_id={$id}", PDO::FETCH_OBJ)->fetch();
        $product->count = 1;
        echo addToCart($product);  # var_dump($kacAdet)
}
else if($islem == "removeFromCart"){
    $id = $_POST["product_id"];

    echo removeFromCart($id);
}
}

if(isset($_GET["p"])){

    $islem = $_GET["p"];

    if($islem == "incCount"){

        $id = $_GET["product_id"];

        if(incCount($id)){
            header("Location:../shopping-cartdeneme.php");
        }
    }
    else if($islem == "decCount"){

        $id = $_GET["product_id"];

        if(decCount($id)){
            header("Location:../shopping-cartdeneme.php");
        }
    }
}
//AddToCart
/**
 * Urun id al
 * cart_db.php dosyasina post et
 * veritabanından urnunun bilgilerini al
 * SESSİON daki sepete ekle
 * Sepeti tekrardan hesapla
 */
?>