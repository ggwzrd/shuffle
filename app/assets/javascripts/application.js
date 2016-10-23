// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $('.delete-song').click(deleteSong);
  $('#add-song').click(addSong);
});

// DELETE SINGLE SONG
function deleteSong(event){
  event.preventDefault();
  $song = $(event.toElement);
  songId = $($song).attr('id');
  removeSong(songId);
}

function cleanView(id){
  $('#'+id).parent().parent().parent().remove();
}
function removeSong(id){
  $.ajax({
      type: "DELETE",
      url: "/songs/" + id + ".json",
      contentType: "application/json",
      dataType: "json"
    }).done(function(data) {
        console.log("done");
        cleanView(id);

      }).fail(function(data){
        console.log("error");
      });
}

// ADD SONG

function addSong(){
  event.preventDefault();
  $('.page-wrapper').fadeIn('slow');
  $('.new-song').fadeIn('slow');
  createSong();
}

function createSong(){

}
