$(document).ready(function(){
$("#update-phone-form").on("submit", function(event){
  event.preventDefault();
  $.ajax({
    url: $(this).attr("action"),
    dataType: "json",
    type: "post",
    data: $(this).serialize()
  }).done(function(response){
    $("#errors").html(response)
  }).fail(function(){
    alert("you failed")
  })
})

$("#texting-form").on("submit", function(event){
  event.preventDefault();
  console.log("in ajax")
  $.ajax({
    url: $(this).attr("action"),
    dataType: "json",
    type: "get"
    }).done(function(response){
    console.log("success");
    if (response.allow_texting == true) {
      $("#texting-form input[type=submit]").val("Disable")
    } else {
      $("#texting-form input[type=submit]").val("Enable")
    }
  })
})

})
