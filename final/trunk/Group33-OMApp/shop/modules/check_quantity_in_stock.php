<?php
  session_start();
  include("config.php");
  if(isset($_POST['item_index'])){
    //$_SESSION['quantity'][$_POST['item_index']] = $_POST['quantity_change'];
    $sql_all = 'select quantity from product where ProductID = '.$_SESSION['id'][$_POST['item_index']];
    $query_all = mysqli_query($conn,$sql_all);
    $row = mysqli_fetch_array($query_all,MYSQLI_ASSOC);
    if($_POST['quantity_change'] > $row['quantity']){
      echo 0;
    }
    else{
      $_SESSION['quantity'][$_POST['item_index']] = $_POST['quantity_change'];
      echo 1;
    }
  }

 ?>
