<?php
   require 'config.php';
   if(isset($_POST['province'])){
     $sql_all = 'select * from district where ProvinceID = '.$_POST['province'];
     $query_all = mysqli_query($conn,$sql_all);
     while ($row = mysqli_fetch_array($query_all,MYSQLI_ASSOC)){
       echo '<option value='.$row['DistrictID'].'>'.$row['DistrictName'].'</option>';
     }
   }
   if(isset($_POST['district'])){
     $sql_all = 'select * from Ward where DistrictID = '.$_POST['district'];
     $query_all = mysqli_query($conn,$sql_all);
     while ($row = mysqli_fetch_array($query_all,MYSQLI_ASSOC)){
       echo '<option value='.$row['WardID'].'>'.$row['WardName'].'</option>';
     }
   }
?>
