$(document).ready(function(){
  $('#delete-song').click(deleteSong);
});

function deleteSong(event){
  event.preventDefault();
  $song = $(event.toElement).parent();
  songId = $($song).parent().attr('id');
  removeSong(songId);
}

function removeSong(id){
  $.ajax({
      type: "DELETE",
      url: "/songs/" + id + ".json",
      contentType: "application/json",
      dataType: "json"
    }).done(function(data) {
        // itemId = data;
        // if(!itemId){
        //   cleanAll();
        //   updateTotalPrice(0);
        // }else{
        //   updateTotalPrice(itemId);
        //   cleanView(itemId);
        // }
        console.log("done");
      }).fail(function(data){
        console.log("error");
      });
}
