var total_price = 0;
var total_quantity = 0;
var formatter = new Intl.NumberFormat('de-DE');

function show_cart_detail(){

  $.ajax({
    type:"post",
    dataType: "json",
    url:"modules/add-item-to-cart.php",
    data:{
      total_cart_items:"totalitems"
    },
    success:function(response) {
      $.each (response, function (key, item){
        total_quantity = item['count']
        if (total_quantity != 0){
          $("#cart_no").html(total_quantity);
        }
        total_price = item['total_price'];
        $("#total_price").html(formatter.format(total_price)+' đ');
        $("#option-cart-item").html(item['list'])
        $("#sub_total").html(formatter.format(total_price)+'đ');
        $("#grant_total").html(formatter.format(total_price)+'đ');
      });
      }
  });
  $.ajax({
      type:"post",
      dataType: "text",
      url:"modules/add-item-to-cart.php",
      data:{
        cart_detail:"cart_detail",
      },
      success:function(response) {
       $("#body_cart").html(response);
       var quantity_detail = $(".quantity");
       var quantity_cart = $(".light-red");
       for(i = 0; i < quantity_detail.length; i++){
        quantity_detail[i].value = quantity_cart[i].innerHTML;
       }
     }
   });

}

$(document).ready(function(){
  show_cart_detail();
});
function quantity_change(index){
    var item_quantity = $(".quantity");
    $.ajax({
      type:"post",
      dataType: "text",
      url:"modules/check_quantity_in_stock.php",
      data:{
        item_index: index,
        quantity_change:item_quantity[index].value
      },
      success:function(response) {
        show_cart_detail();
        $(document).ready(function(){
           if (response==0){
              setTimeout(function(){
                  $('#error_label'+index).text('Warning:Not enough item in stock!');
              }, 300);
          }
        });
     }
    });

}
function delete_from_cart(index){
  var item_price = $(".item_price");
  var item_quantity = $(".quantity");

  $.ajax({
      type:"post",
      dataType: "text",
      url:"modules/add-item-to-cart.php",
      data:{
         delete_item_index: index,
      },
      success:function(response) {

        show_cart_detail();
      }
    });
}
