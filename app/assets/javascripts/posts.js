$(function(){``
  //jquery loaded
 $("#post-comment-icon").on("click",function(){
  $("#comment_comment").focus();
 });


  $(".post-like").on("click",function(){
    var post_id=$(this).data("id");
    console.log("button clicked");
    $.ajax({
      url: "/post/like/"+post_id,
      method: "GET"
    }).done(function(response){
      console.log(response);
      })
  })

  $("#searchBtn").on("click",function(){
    console.log("button clicked");
    $("#cccc").hide();
  })

});


