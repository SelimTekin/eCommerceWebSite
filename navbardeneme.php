<?php

session_start();
require_once "lib/db.php";

if(isset($_SESSION["shoppingCart"])){
    $shoppingCart = $_SESSION["shoppingCart"];

    $total_count = $shoppingCart["summary"]["total_count"];
    $total_price = $shoppingCart["summary"]["total_price"];
    $shopping_products = $shoppingCart["products"];
}else{
    $total_count = 0;
    $total_price = 0.0;
}

?>
<nav class="navbar navbar-expand-md navbar-dark bg-info">
    <div class="container-fluid">
      <h3 class="my-2 header mx-5">SelArEn</h3>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse " id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mx-auto mb-md-0 list">
        <li class="nav-item">
            <a class="nav-link" aria-current="page" href="indexdeneme.php">Ana Sayfa</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="oturmaOdasi.php">Oturma Odası</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="mutfak.php">Mutfak</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="yatakOdasi.php">Yatak Odası</a>
          </li>
          <ul class="nav navbar-nav navbar-right">
        <li class="my-2">
            <a href="shopping-cartdeneme.php" style="text-decoration: none;">
            <img alt="Shopping Cart icon" srcset="https://img.icons8.com/ios-glyphs/72/shopping-cart--v1.png 2x" class="basket">
                <span class="badge cart-count" style="background-color: #d9534f;"><?php echo $total_count; ?></span>
            </a>
        </li>
      </ul>
      
        </ul>

        <!--<form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>-->
        <div class="dropdown text-end mx-5">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" href="login.php">Giriş Yap</a></li>
            <li><a class="dropdown-item" href="register.php">Kaydol</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout.php">Çıkış Yap</a></li>
          </ul>
        </div>
      </div>
      
    </div>
  </nav>
