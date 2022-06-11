<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yatak Odası</title>
    
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="bootstrap-5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-5.0.2/dist/css/custom1.css">

</head>
<body>
<?php require_once "lib/db.php"?>

<?php

/* Verileri Çekme Bölümü */

$products = $db->query("select * from urunler where kategori_id=3", PDO::FETCH_OBJ)->fetchAll();

?>

<?php include "lib/navbardeneme.php"?>
<!-----------------------------------#Main Content--------------------------------------------->

  <div class="container">
  <h2 class="text-center">Ürün Listesi</h2><hr>
    <div class="row">
      <?php 
      foreach($products as $product){?>
      <div class="col-sm-6 col-md-3 card">
          <div class="thumbnail">
              <img src="images/<?php echo $product->urun_foto; ?>" alt="<?php echo $product->urun_adi; ?>"  class="foto my-2">              
              <div class="caption">
                  <h3><?php echo $product->urun_adi; ?></h3>
                  <p><?php echo $product->urun_detay; ?></p>
                  <p class="text-right price-container"><strong><?php echo $product->satis_fiyat; ?> TL</strong></p>
                  <p>
                      <button product-id="<?php echo $product->urun_id; ?>" class="btn btn-info btn-block addToCartBtn" role="button" style="width:100%;">
                      <img class="mx-2" alt="Shopping Cart icon" srcset="https://img.icons8.com/ios-glyphs/72/shopping-cart--v1.png 2x" style="height:20px">Sepete Ekle
                      </button>
                  </p>
              </div>
          </div>
      </div>
      
      <?php } ?>
    </div>
  </div>
  <?php include "footer.php"?>
<!-----------------------------------#Main Content--------------------------------------------->
    
    <script src="bootstrap-5.0.2/dist/js/jquery-3.6.0.min.js"></script>
    <script src="bootstrap-5.0.2/dist/js/bootstrap.min.js"></script>
    <script src="bootstrap-5.0.2/dist/js/customdeneme.js"></script>
</body>
</html>