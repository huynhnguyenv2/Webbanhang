<div class="menu">
    	<ul>
            <li><a href="index.php?quanly=sanpham&ac=them">Quản lý sản phẩm</a></li>
            <li><a href="index.php?quanly=sanpham&ac=lietke">Kho hàng</a></li>
            <li><a href="#">Báo cáo hàng hóa</a></li>
            <li><a href="index.php?quanly=capthanhvien&ac=them">Cấp thành viên</a></li>
            <li style="float:right;margin-right:100px;line-height:40px"><a href="login.php">
              <input type="submit" name="logout" value="Đăng xuất" style="background:#06F;color:#CCC;width:200px;height:30px;" />
            </a></li>
            </form>
        </ul>
       
    </div>

 <form action="index.php?quanly=timkiem&ac=sp" method="post" enctype="multipart/form-data">
     <p><input type="text" name="masp" placeholder="Nhập mã sản phẩm..." id="timkiem" required="required" />
        <input type="submit" id="button_timkiem" name="timkiem" value="Tìm sản phẩm" />
   </p>
</form>