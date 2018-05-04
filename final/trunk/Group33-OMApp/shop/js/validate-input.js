
 function is_valid_phone_number(phonenumber){
    var regex = /[0-9]{10,11}/;
    return phonenumber.match(regex)?true:false;
 }
 function is_valid_name(name){
    var regex = /[a-zA-Z][a-zA-z\s]*/;
    return name.match(regex)?true:false;
 }
 $(document).ready(function(){

   $("#province").change(function(){
     $.ajax({
       type:"post",
       dataType: "text",
       url:"modules/query-district.php",
       data:{
         province: $(this).val()
       },
       success:function(response) {
         var opt0 = '<option value=0>-- Select District --</option>'
         $("#district").html(opt0+response);

         }
     });
   });
   //
   $("#district").change(function(){
     //alert(#("#district").text());
     $.ajax({
       type:"post",
       dataType: "text",
       url:"modules/query-district.php",
       data:{
         district: $(this).val()
       },
       success:function(response) {
         var opt0 = '<option value=0>-- Select Ward --</option>'
         $("#ward").html(opt0+response);

         }
     });
   });
   //
   $("#firstname_invalid").hide();
   $("#lastname_invalid").hide();
   $("#phonenumber_invalid").hide();
   $("#province_invalid").hide();
   $("#district_invalid").hide();
   $("#ward_invalid").hide();
   //
   $('form').submit(function (){
     var has_error = false;
     var first_error_field = "";
     if(!is_valid_name($("#firstname").val())){
       $("#firstname_invalid").show();
       has_error = true;
       first_error_field = "firstname";
     }
     else{
       $("#firstname_invalid").hide();
       $("#firstname").css('border-color','green');
     }
     if(!is_valid_name($("#lastname").val())){
       $("#lastname_invalid").show();
       if(!has_error){
         first_error_field = "lastname";
         has_error = true;
       }
     }
     else {
       $("#lastname_invalid").hide();
       $("#lastname").css('border-color','green');
     }
     if(!is_valid_phone_number($("#phonenumber").val())){
         $("#phonenumber_invalid").show();
         if(!has_error){
           first_error_field = "phonenumber";
           has_error = true;
         }
     }
     else {
       $("#phonenumber_invalid").hide();
       $("#phonenumber").css('border-color','green');
     }
     if($("#province").val()==0){
          $("#province_invalid").show();
     }
     else{
        $("#province_invalid").hide();
     }
     if($("#district").val()==0){
          $("#district_invalid").show();
     }
     else{
        $("#district_invalid").hide();
     }
     if($("#ward").val()==0){
          $("#ward_invalid").show();
     }
     else{
        $("#ward_invalid").hide();
     }

     $("#"+first_error_field).css('border-color','red');
     $("#"+first_error_field).focus();
     // If no error, send data to backend to process
     /*$.ajax({
       type:"post",
       dataType: "text",
       url:"submit-orders.php",
       data:{
         district: $(this).val()
       },
       success:function(response) {
         alert(response);
     });*/
     return !has_error;

   });


   });
