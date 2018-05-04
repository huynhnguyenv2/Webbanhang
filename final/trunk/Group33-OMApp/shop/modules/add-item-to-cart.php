<?php
  session_start();


  if(isset($_POST['total_cart_items']))
    {
      $count = isset($_SESSION['id'])?count($_SESSION['id']):0;
      if($count > 0){
        $_SESSION['id'] = array_values($_SESSION['id']);
        $_SESSION['name'] = array_values($_SESSION['name']);
        $_SESSION['price'] = array_values($_SESSION['price']);
        $_SESSION['src'] = array_values($_SESSION['src']);
        $_SESSION['quantity'] = array_values($_SESSION['quantity']);
      }
      $total_price = 0;
      $li = '';
      for($i = 0;$i < $count;$i++){
          $li = $li."<li id=\"item_cart".$i."\">";
          $li = $li.  '<div class="cart-item">';
          $li = $li.     '<div class="image"><img src="'.$_SESSION['src'][$i].'" alt=""></div>';
          $li = $li.       "<div class=\"item-description\">";
          $li = $li.         "<p class=\"name\">".$_SESSION['name'][$i]."</p>";
          $li = $li.         "<p>Quantity: <span class=\"light-red\">".$_SESSION['quantity'][$i]."</span></p>";
          $li = $li.       "</div>";
          $li = $li.     "<div class=\"right\">";
          $li = $li.        '<p class="price">'.number_format($_SESSION['quantity'][$i]*$_SESSION['price'][$i]).'<sup>đ</sup></p>';
          $li = $li.        '<p hidden id="item'.$i.'_cart_price">'.$_SESSION['price'][$i].'</p>';
          $li = $li.        "<p class=\"remove\" onclick=\"delete_from_cart(".$i.")\"><img src=\"images/remove.png\"></p>";
          $li = $li.    "</div>";
          $li = $li.  "</div>";
          $li = $li. "</li>";

          $total_price = $total_price + $_SESSION['quantity'][$i]*$_SESSION['price'][$i];

      }
      $li = $li. '<li><span class="total" >Total <strong id="total_price">'.number_format($total_price).' đ</strong></span><button class="checkout" onClick="location.href=\'cart.html\'">CheckOut</button></li>';
      $result[] = array(
              'count' => $count,
              'list' => $li,
              'total_price' => $total_price
      );
      echo json_encode($result);
  	  exit();
    }

  if(isset($_POST['item_src']))
  {
    $_SESSION['id'][]=$_POST['item_id'];
    $_SESSION['name'][]=$_POST['item_name'];
    $_SESSION['price'][]=$_POST['item_price'];
    $_SESSION['src'][]=$_POST['item_src'];
    $_SESSION['quantity'][]=$_POST['item_quantity'];


    $last = count($_SESSION['src']) -  1;

     echo "<li id=\"item_cart".$last."\">";
     echo   '<div class="cart-item">';
     echo     '<div class="image"><img src="'.$_SESSION['src'][$last].'" alt=""></div>';
     echo       "<div class=\"item-description\">";
     echo         "<p class=\"name\">".$_SESSION['name'][$last]."</p>";
     echo         "<p>Quantity: <span class=\"light-red\">".$_SESSION['quantity'][$last]."</span></p>";
     echo          "<p hidden id=\"index\">".$last."</p>";
     echo       "</div>";
     echo     "<div class=\"right\">";
     echo        '<p class="price">'.number_format($_SESSION['quantity'][$last]*$_SESSION['price'][$last]).'<sup>đ</sup></p>';
     echo        '<p hidden id="item'.$last.'_cart_price">'.$_SESSION['price'][$last].'</p>';
     echo        "<p class=\"remove\" onclick=\"delete_from_cart(".$last.")\"><img src=\"images/remove.png\"></p>";
     echo    "</div>";
     echo  "</div>";
     echo "</li>";
     exit();

  }
  if(isset($_POST['delete_item_index'])){
    $index = $_POST['delete_item_index'];
    //$id = $_SESSION['id'][$index];
    unset($_SESSION['id'][$index]);
    unset($_SESSION['name'][$index]);
    unset($_SESSION['price'][$index]);
    unset($_SESSION['src'][$index]);
    unset($_SESSION['quantity'][$index]);
    //echo $id;
  }

  if(isset($_POST['cart_detail'])){

    if(isset($_SESSION['id'])){
      $_SESSION['id'] = array_values($_SESSION['id']);
      $_SESSION['name'] = array_values($_SESSION['name']);
      $_SESSION['price'] = array_values($_SESSION['price']);
      $_SESSION['src'] = array_values($_SESSION['src']);
      $_SESSION['quantity'] = array_values($_SESSION['quantity']);

      for($i = 0;$i < count($_SESSION['src']);$i++){
          echo '<tr id="item_row'.$i.'">';
          echo  '<td>';
          echo  '  <img src="'.$_SESSION['src'][$i].'" alt="">';
          echo  '</td>';
          echo  '<td>';
          echo  '  <div class="shop-details">';
          echo  '    <div class="productname">';
          echo        $_SESSION['name'][$i];
          echo  '  </div>';
          echo  ' <p>';
          echo  '    <img alt="" src="images/star.png">';
          echo  '     <a class="review_num" href="#">';
          echo  '        02 Review(s)';
          echo  '     </a>';
          echo  ' </p>';
          echo  ' <div class="color-choser">';
          echo  '     <span class="text">';
          echo  '       Product Color :';
          echo  '   </span>';
          echo  ' <ul>';
          echo     '<li>';
          echo            '<a class="black-bg " href="#">';
          echo             'black';
          echo            '</a>';
          echo     '</li>';
          echo     '<li><a class="red-bg" href="#">light red</a></li>';
          echo      '</ul>';
          echo      '</div>';
          echo      '<p class="error_label" id="error_label'.$i.'" style="color:red;font-style:italic"></p>';
          echo    '</div>';
          echo  '</td>';
          echo  '<td><h5>'.number_format($_SESSION['price'][$i]).'<sup>đ</sup></h5></td>';
          echo  '<td><select onchange="quantity_change('.$i.')" class="quantity" id="quantity'.$i.'" name=""><option selected value="1">1</option><option value="2">2</option><option value="3">3</option></select></td>';
          echo  '<td><h5><strong class="red">'.number_format($_SESSION['quantity'][$i]*$_SESSION['price'][$i]).'</strong></h5></td>';
          echo  '<td><p onclick="delete_from_cart('.$i.')"><img src="images/remove.png" alt=""></p></td>';
          echo  '<td hidden id="item'.$i.'_price" class="item_price">'.$_SESSION['price'][$i].'</td>';
          echo  '<td hidden id="item'.$i.'_id">'.$_SESSION['id'][$i].'</td>';
          echo  '</tr>';
        }
      }



   exit();

  }

?>
