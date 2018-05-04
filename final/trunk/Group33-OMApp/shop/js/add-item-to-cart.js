var total_price = 0;
var total_quantity = 0;
var formatter = new Intl.NumberFormat('de-DE');

$(document).ready(function(){
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
          formatter.format(total_price);
          $("#total_price").html(formatter.format(total_price)+" đ");
          $("#option-cart-item").prepend(item['list'])

        });

        }
    });
});

  function add_to_cart(id)
  {
    var id_tag = 'item'+id;
    var ele=document.getElementById(id_tag);
    var img_src=ele.getElementsByTagName("img")[0].src;
    var name=document.getElementById(id_tag+"_name").innerHTML;
    var price=document.getElementById(id_tag+"_price").innerHTML;

    $.ajax({
        type:"post",
        dataType: "text",
        url:"modules/add-item-to-cart.php",
        data:{
          item_id: id,
          item_src:img_src,
          item_name:name,
          item_price:price,
          item_quantity: 1
        },
        success:function(response) {
          //alert(response);
          $("#option-cart-item").prepend(response);
            total_price += parseInt(price);
            total_quantity += 1;
            $("#total_price").html(formatter.format(total_price)+" đ");
            $("#cart_no").html(total_quantity);
        }
      });

    }
   function delete_from_cart(index){
     $.ajax({
         type:"post",
         dataType: "text",
         url:"modules/add-item-to-cart.php",
         data:{
            delete_item_index: index,
         },
         success:function(response) {
           total_quantity -= 1;
           $("#cart_no").html(total_quantity>0?total_quantity:"");
           total_price -= parseInt($("#item"+index+"_cart_price").text());
           $("#item_cart"+index).remove();
           $("#total_price").html(formatter.format(total_price)+" đ");
         }
       });
   }
