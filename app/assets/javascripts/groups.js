$(document).ready(function(response){

  // replaces link with form

  // $("#new-group-link").on("click", function(event){
  //   event.preventDefault();
  //   $.ajax({
  //     url: "/groups/new",
  //     type: "get",
  //     dataType: "html"
  //   }).done(function(response){
  //     $("#new-group-link").replaceWith(response);
  //   })
  // })

// slide transitions
  // $("#new-group-link").on("click", function(event){
  //   var effect = 'slide';
  //   var options = { direction: "left"};
  //   var duration = 500;
  //   $("#new-group-link").toggle(effect, options, duration);
  //   $("#group-list").toggle(effect, options, duration);
  //   $("#invitations-link").toggle(effect, options, duration);
  // })

  // create a new group
  // $(".new_group").on("submit", function(event){
  //   event.preventDefault();
  //   var url = $(this).attr("action")
  //   var data = $("form").serialize();
  //   $.ajax({
  //     url: url,
  //     type: "post",
  //     dataType: "json",
  //     data: data
  //   }).done(function(response){
  //     $(".new_group").replaceWith("<span id='group_header'>"+response.name+"</span>");

  //     var group_id = response.id

  //     show_group_edits(group_id);
  //   })
  // })

  // show options to add people to the group
  function show_group_edits(group_id){
    $.ajax({
      url: "/groups/"+group_id+"/edit",
      type: "get",
      dataType: "html"
    }).done(function(response){
      // console.log("done");
      $(".new-group-form").after(response)
    })
  }

// switch between chat and map. toggle class?
  // $("#chat-link").on("click", function(event){
  //   event.preventDefault();
  //   $("#map-canvas").hide();
  //   $("#chat-canvas").show();
  // })

  // $("#map-link").on("click", function(event){
  //   event.preventDefault();
  //   $("#chat-canvas").hide();
  //   $("#map-canvas").show();
  // })

})
