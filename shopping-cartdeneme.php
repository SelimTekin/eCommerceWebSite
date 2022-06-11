<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <!--<link rel="stylesheet" href="assets/css/bootstrap.min.css">-->
    
    <link rel="stylesheet" href="bootstrap-5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-5.0.2/dist/css/custom1.css">

    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->
</head>
<body>


<?php include "lib/navbardeneme.php"?>

<!-----------------------------------Main Content--------------------------------------------->
<div class="container">

    <?php if($total_count > 0) { ?>
        <h2 class="text-center mt-5">Sepetinizde <strong class="color-danger"><?php echo $total_count; ?></strong> adet ürün bulunmaktadır.</h2>
        <hr>
        <div class="row">
            <div class="col-md-12 col-md-offset-2">
                <table class="table table-hover table-bordered table-striped">

                <thead>
                    <th class="text-center">Ürün Resmi</th>
                    <th class="text-center">Ürün Adı</th>
                    <th class="text-center">Fiyatı</th>
                    <th class="text-center">Adeti</th>
                    <th class="text-center">Toplam</th>
                    <th class="text-center">Sepetten Çıkar</th>
                    <th class="text-center">Ödeme</th>
                </thead>
                
                <tbody>
                    <?php foreach($shopping_products as $product) { ?>
                    <tr>
                    <td class="text-center" width="120">
                        <img src="images/<?php echo $product->urun_foto; ?>" alt="" width="50">
                    </td>
                    <td class="text-center"><?php echo $product->urun_adi; ?></td>
                    <td class="text-center"><?php echo $product->satis_fiyat; ?></td>
                    <td class="text-center">
                        <a href="lib/cart_dbdeneme.php?p=incCount&product_id=<?php echo $product->urun_id; ?>" class="btn btn-xs">
                        <img srcset="https://img.icons8.com/fluency/344/add.png 2x" alt="icon" loading="lazy" width="30">
                        </a>
                        <input type="text" class="item-count-input" value="<?php echo $product->count; ?>">
                        <a href="lib/cart_dbdeneme.php?p=decCount&product_id=<?php echo $product->urun_id; ?>" class="btn btn-xs ">
                        <img srcset="https://img.icons8.com/fluency/344/minus.png 2x" alt="icon" loading="lazy" width="30">
                        </a>
                    </td>
                    <td class="text-center"><?php echo $product->total_price; ?></td>
                    <td class="text-center" width="140">
                        <button product-id="<?php echo $product->urun_id; ?>" class="btn btn-sm btn-danger removeFromCartBtn">
                            <span class="glyphicon glyphicon-remove"></span>
                            Sepetten Çıkar
                        </button>
                    </td>
                    <td class="text-center" width="140">
                        <button product-id="<?php echo $product->urun_id; ?>" class="btn btn-sm btn-success">
                            Ödeme Yap
                        </button>
                    </td>
                    </tr>
                    <?php } ?>
                </tbody>
                <tfoot>
                    <th colspan="2" class="text-left">Toplam Ürün : <span class="color-danger"><?php echo $total_count; ?></span></th>
                    <th colspan="5" ><span class="text-right">Toplam Fiyat : <span class="color-danger"><?php echo $total_price; ?></span></span></th>
                </tfoot>
                </table>
            </div>
        </div>
    <?php } else { ?>
        <div class="alert alert-info my-5">
            <strong>Sepetinizde ürün bulunmamaktadır. Eklemek için <a href="indexdeneme.php">tıklayınız.</a></strong>
        </div>
    <?php } ?>
</div>

<footer style="margin-top: 500px"><hr style="width:80%; margin:auto"><p style="text-align: center">Copyright © 2021-2022 Selim Works, Inc. - All Rights Reserved.</p></footer>


<!-----------------------------------#Main Content--------------------------------------------->
    <script src="bootstrap-5.0.2/dist/js/jquery-3.6.0.min.js"></script>
    <script src="bootstrap-5.0.2/dist/js/bootstrap.min.js"></script>
    <script src="bootstrap-5.0.2/dist/js/customdeneme.js"></script>
</body>
</html>