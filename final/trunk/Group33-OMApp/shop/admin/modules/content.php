 <div class="content">
    	<div class="box_contains">
        	<?php
				if(isset($_GET['quanly'])&&$_GET['ac']){
					$tam=$_GET['quanly'];
					$tam1=$_GET['ac'];
					}else{
						$tam='';
					}if(($tam == 'sanpham')&&($tam1 == 'them')){
						
						include('modules/quanlysanpham/them.php');
					}elseif(($tam == 'sanpham')&&($tam1 == 'lietke')){						
						include('modules/quanlysanpham/lietke.php');
					}elseif(($tam == 'sanpham')&&($tam1 == 'sua')){			
						include('modules/quanlysanpham/sua.php');
					}elseif(($tam == 'timkiem')&&($tam1 == 'sp')){						
						include('modules/timkiem/timkiem.php');
					}elseif(($tam == 'capthanhvien')&&($tam1 == 'them')){						
						include('modules/capthanhvien/capthanhvien.php');
					}else{
						include('modules/quanlysanpham/lietke.php');
					}
			?>
        
        </div>
    </div>
    <div class="clear"></div>