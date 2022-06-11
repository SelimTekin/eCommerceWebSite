<?php
    try{
        //$db = new PDO("mysql:hostname=localhost;dbname=cart;charset:utf8", "root", "");
        $db = new PDO("mysql:hostname=localhost;dbname=market;charset:utf8", "root", "");
    }catch(PDOException $e){
        echo $e->getMessage();
    }

    /*$servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "market";

    // Bağlantı yarat
    $db = new mysqli($servername, $username, $password, $dbname);
    //$_SESSION["conn"]=$conn;

    // Bağlantıyı kontrol et
    if ($db->connect_error) {
        die("Bağlantı Hatası: " . $db->connect_error);
    }
    else 
        echo "Connected successfully";*/
?>