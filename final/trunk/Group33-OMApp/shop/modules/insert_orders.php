<?php
  require 'config.php';
  session_start();
  // Orders Number
  $increment_sql = 'select AUTO_INCREMENT
                    from information_schema.TABLES
                    where TABLE_SCHEMA = "om"
                      and TABLE_NAME = "orders"';
  $query_all = mysqli_query($conn,$increment_sql);
  $row = mysqli_fetch_array($query_all,MYSQLI_ASSOC);
  $orders_id = $row['AUTO_INCREMENT'];
  $orders_number = 'ORD.'.date('ymd').'.'.$orders_id;
  // Address
  $address_sql = 'select w.WardName, d.DistrictName, p.ProvinceName
                  from province p, district d, ward w
                  where p.ProvinceID = d.ProvinceID
                    and d.DistrictID = w.DistrictID
                    and p.ProvinceID ='.$_POST['province'].'
                    and d.DistrictID ='.$_POST['district'].'
                    and w.WardID ='.$_POST['ward'];
  $query_all = mysqli_query($conn,$address_sql);
  $row = mysqli_fetch_array($query_all,MYSQLI_ASSOC);
  $address = $_POST['street'].', '.$row['WardName'].', '.$row['DistrictName'].', '.$row['ProvinceName'];
  // Insert Cart
  if(isset($_SESSION['id'])){
    $total_price = 0;
    $count = isset($_SESSION['id'])?count($_SESSION['id']):0;
    for($i = 0;$i < $count;$i++)
        $total_price = $total_price + $_SESSION['quantity'][$i]*$_SESSION['price'][$i];

    // Insert Cart
    $increment_sql = 'select AUTO_INCREMENT
                      from information_schema.TABLES
                      where TABLE_SCHEMA = "om"
                        and TABLE_NAME = "cart"';
    $query_all = mysqli_query($conn,$increment_sql);
    $row = mysqli_fetch_array($query_all,MYSQLI_ASSOC);
    $cart_id = $row['AUTO_INCREMENT'];
    $cart_sql = 'insert into OM.CART(totalprice) values('.$total_price.')';

    mysqli_query($conn,$cart_sql);

    // Insert Cart detail
    for($i = 0;$i < $count;$i++){
      $detail_sql = 'insert into OM.cart_product(CartID,ProductID,Quantity) values('.$cart_id.','.$_SESSION['id'][$i].','.$_SESSION['quantity'][$i].')';
      mysqli_query($conn,$detail_sql);
    }
    // Insert Customer
    $increment_sql = 'select AUTO_INCREMENT
                      from information_schema.TABLES
                      where TABLE_SCHEMA = "om"
                        and TABLE_NAME = "customer"';
    $query_all = mysqli_query($conn,$increment_sql);
    $row = mysqli_fetch_array($query_all,MYSQLI_ASSOC);
    $customer_id = $row['AUTO_INCREMENT'];
    $customer_sql = 'insert into OM.customer(CustomerNumber,FirstName,LastName,PhoneNumber,Street,WardID,DistrictID,ProvinceID)
                     values("KH0000'.$customer_id.'","'.$_POST['firstname'].'","'.$_POST['lastname'].'","'
                            .$_POST['phonenumber'].'","'.$_POST['street'].'",'.$_POST['ward'].','
                            .$_POST['district'].','.$_POST['province'].')';
  //  echo $customer_sql;
    $query_all = mysqli_query($conn,$customer_sql);
    // Insert Orders
    $orders_sql = 'insert into OM.orders(OrdersNumber,OrderDate,Status,Transportationmethod,CartID,CustomerID)
                     values("'.$orders_number.'",date("'.date('Y-m-d').'"),"Pre-Complete","",'
                            .$cart_id.','.$customer_id.')';
    //echo $orders_sql;
    mysqli_query($conn,$orders_sql);


    $orders_sql = 'select * from om.orders_v where ordersID = '.$orders_id;
    $query_all = mysqli_query($conn,$orders_sql);
    $row = mysqli_fetch_array($query_all,MYSQLI_ASSOC);

    echo '<tr><td>Orders Number</td>';
    echo    '<td>'.$row['OrdersNumber'];
    echo    '</td>';
    echo  '</tr>';

    echo '<tr><td>Date</td>';
    echo    '<td>'.$row['OrderDate'];
    echo    '</td>';
    echo  '</tr>';

    echo '<tr><td>First Name</td>';
    echo    '<td>'.$row['CustomerFirstName'];
    echo    '</td>';
    echo  '</tr>';

    echo '<tr><td>Last Name</td>';
    echo    '<td>'.$row['CustomerLastName'];
    echo    '</td>';
    echo  '</tr>';

    echo '<tr><td>Last Name</td>';
    echo    '<td>'.$row['PhoneNumber'];
    echo    '</td>';
    echo  '</tr>';

    echo '<tr><td>Last Name</td>';
    echo    '<td>'.$row['Street'].', '.$row['WardName'].', '.$row['DistrictName'].', '.$row['ProvinceName'];
    echo    '</td>';
    echo  '</tr>';

  }
?>
