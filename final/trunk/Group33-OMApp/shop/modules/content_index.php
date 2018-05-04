<?php
   $sql_all = 'select * from product';
   $query_all = mysqli_query($conn,$sql_all);

   $sqlFea_all = 'select * from product where Price > 20000000';
   $queryFea_all = mysqli_query($conn,$sqlFea_all);
?>

<div class="hom-slider">
         <div class="container">
            <div id="sequence">
               <div class="sequence-prev"><i class="fa fa-angle-left"></i></div>
               <div class="sequence-next"><i class="fa fa-angle-right"></i></div>
               <ul class="sequence-canvas">
                  <li class="animate-in">
                     <div class="flat-caption caption1 formLeft delay300 text-center"><span class="suphead">Oppo Camera Phone</span></div>
                     <div class="flat-caption caption2 formLeft delay400 text-center">
                        <h1>Camera Selfie</h1>
                     </div>
                     <div class="flat-caption caption3 formLeft delay500 text-center">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.<br>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                     </div>
                     <div class="flat-button caption4 formLeft delay600 text-center"><a class="more" href="#">More Details</a></div>
                     <div class="flat-image formBottom delay200" data-duration="5" data-bottom="true"><img src="image/image_index/pic1.png" alt=""></div>
                  </li>
                  <li>
                     <div class="flat-caption caption2 formLeft delay400">
                        <h1>Apple Iphone X </h1>
                     </div>
                     <div class="flat-caption caption3 formLeft delay500">
                        <h2>Etiam velit purus, luctus vitae velit sedauctor<br>egestas diam, Etiam velit purus.</h2>
                     </div>
                     <div class="flat-button caption5 formLeft delay600"><a class="more" href="#">More Details</a></div>
                     <div class="flat-image formBottom delay200" data-bottom="true"><img src="image/image_index/pic2.png" alt=""></div>
                  </li>
                  <li>
                     <div class="flat-caption caption2 formLeft delay400 text-center">
                        <h1>New Fashion of 2013</h1>
                     </div>
                     <div class="flat-caption caption3 formLeft delay500 text-center">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. <br>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                     </div>
                     <div class="flat-button caption4 formLeft delay600 text-center"><a class="more" href="#">More Details</a></div>
                     <div class="flat-image formBottom delay200" data-bottom="true"><img src="image/image_index/pic3.png" alt=""></div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
      <div class="clearfix"></div>
      <div class="container_fullwidth">
         <div class="container">
            <div class="hot-products">
               <h3 class="title"><strong>Hot</strong> Products</h3>
               <div class="control"><a id="prev_hot" class="prev" href="#">&lt;</a><a id="next_hot" class="next" href="#">&gt;</a></div>
               <ul id="hot">
                  <li>
                     <div class="row">
                        <?php
                           $count = 0;
                           while ($dong_all = mysqli_fetch_array($query_all,MYSQLI_ASSOC) and $count < 8){
                              $count++;
                        ?>
                        <div class="col-md-3 col-sm-6">
                           <div class="products" id= 'item<?php echo $dong_all['ProductID'] ?>'>
                              <div class="thumbnail"><a href="details.html"><img src="image/<?php echo $dong_all["ProductNumber"] ?>.jpg" alt="Product Name" style="height: 200px;" id='item<?php echo $dong_all['ProductID'] ?>_img'></a></div>
                              <div id ='item<?php echo $dong_all['ProductID'] ?>_name'class="productname"><?php echo $dong_all['ProductName'] ?></div>
                              <h4  class="price"><?php echo number_format($dong_all['Price'])?><sup>đ</sup></h4>
                              <h4 hidden id= 'item<?php echo $dong_all['ProductID'] ?>_price' class="price"><?php echo $dong_all['Price']?></h4>
                              <h4 hidden id="product_number"><?php echo $dong_all['ProductNumber']?></h4>
                              <div class="button_group">
                                <button onclick="add_to_cart(<?php echo $dong_all['ProductID'] ?>)"class="button add-cart" type="button">Add To Cart</button>
                              </div>
                           </div>
                        </div>
                        <?php } ?>
                     </div>
                  </li>
                  <li>
                     <div class="row">
                        <?php

                           while ($dong_all = mysqli_fetch_array($query_all,MYSQLI_ASSOC) and $count <= 12){
                              $count++;
                        ?>
                        <div class="col-md-3 col-sm-6">
                           <div class="products" id= 'item<?php echo $dong_all['ProductID'] ?>'>
                              <div class="thumbnail"><a href="details.html"><img src="image/<?php echo $dong_all["ProductNumber"] ?>.jpg" alt="Product Name" style="height: 200px;" id='item<?php echo $dong_all['ProductID'] ?>_img'></a></div>
                              <div id ='item<?php echo $dong_all['ProductID'] ?>_name'class="productname"><?php echo $dong_all['ProductName'] ?></div>
                              <h4 id= 'item<?php echo $dong_all['ProductID'] ?>_price' class="price"><?php echo number_format($dong_all['Price'])?><sup>đ</sup></h4>
                              <div class="button_group">
                                <button onclick="add_to_cart('item<?php echo $dong_all['ProductID'] ?>')"class="button add-cart" type="button">Add To Cart</button>
                              </div>
                           </div>
                        </div>
                        <?php } ?>
                     </div>
                  </li>
               </ul>
            </div>
            <div class="clearfix"></div>
            <div class="featured-products">
               <h3 class="title"><strong>Featured </strong> Products</h3>
               <div class="control"><a id="prev_featured" class="prev" href="#">&lt;</a><a id="next_featured" class="next" href="#">&gt;</a></div>
               <ul id="featured">
                  <li>
                     <div class="row">
                         <?php
                           $count = 0;
                           while (  $dong_all = mysqli_fetch_array($queryFea_all,MYSQLI_ASSOC) and $count < 4){
                              $count++;
                        ?>
                        <div class="col-md-3 col-sm-6">
                           <div class="products" id= 'item<?php echo $dong_all['ProductID'] ?>'>
                              <div class="thumbnail"><a href="details.html"><img src="image/<?php echo $dong_all["ProductNumber"] ?>.jpg" alt="Product Name" style="height: 200px;" id='item<?php echo $dong_all['ProductID'] ?>_img'></a></div>
                              <div id ='item<?php echo $dong_all['ProductID'] ?>_name'class="productname"><?php echo $dong_all['ProductName'] ?></div>
                              <h4 id= 'item<?php echo $dong_all['ProductID'] ?>_price' class="price"><?php echo number_format($dong_all['Price'])?><sup>đ</sup></h4>
                              <div class="button_group">
                                <button onclick="add_to_cart('item<?php echo $dong_all['ProductID'] ?>')"class="button add-cart" type="button">Add To Cart</button>

                              </div>
                           </div>
                        </div>
                        <?php } ?>

                     </div>
                  </li>
                  <li>
                     <div class="row">
                        <?php
                           $count = 0;
                           while (  $dong_all = mysqli_fetch_array($queryFea_all,MYSQLI_ASSOC) and $count < 4){
                              $count++;
                        ?>
                        <div class="col-md-3 col-sm-6">
                           <div class="products" id= 'item<?php echo $dong_all['ProductID'] ?>'>
                              <div class="thumbnail"><a href="details.html"><img src="image/<?php echo $dong_all["ProductNumber"] ?>.jpg" alt="Product Name" style="height: 200px;" id='item<?php echo $dong_all['ProductID'] ?>_img'></a></div>
                              <div id ='item<?php echo $dong_all['ProductID'] ?>_name'class="productname"><?php echo $dong_all['ProductName'] ?></div>
                              <h4 id= 'item<?php echo $dong_all['ProductID'] ?>_price' class="price"><?php echo number_format($dong_all['Price'])?><sup>đ</sup></h4>
                              <div class="button_group">
                                <button onclick="add_to_cart('item<?php echo $dong_all['ProductID'] ?>')"class="button add-cart" type="button">Add To Cart</button>
                              </div>
                           </div>
                        </div>
                        <?php } ?>
                     </div>
                  </li>
               </ul>
            </div>
            <div class="clearfix"></div>

         </div>
      </div>
