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
  $('.delete-song').click(removeSong);
  $('#add-song').click(addSong);
  $('#delete-all').click(deleteSongs);
});

// DELETE SINGLE SONG
function removeSong(event){
  event.preventDefault();
  $song = $(event.toElement);
  songId = $($song).attr('id');
  deleteSong(songId);
}

function cleanView(id){
  $('#'+id).remove();
}
function deleteSong(id){
  $.ajax({
      type: "DELETE",
      url: window.location.pathname+"/songs/" + id + ".json",
      contentType: "application/json",
      dataType: "json"
    }).done(function(data) {
        cleanView(id);

      }).fail(function(data){
        console.error("error");
      });
}

// ADD SONG

function addSong(){
  event.preventDefault();
  $('.page-wrapper').fadeIn('slow');
  $('.new-song').fadeIn('slow');
  $('#abort-song-creation').click(function(){
    $('.page-wrapper').fadeOut('slow');
    $('.new-song').fadeOut('slow');
  });

  $('#create-new-song').click(checkValues);
}

function checkValues(){
   $('#song-title').val() ? title = $('#song-title').val() : $('#song-title').css({"border-color": "red", "box-shadow": "1px 1px 2px red"});
   $('#song-genre').val() ? genre = $('#song-genre').val() : $('#song-genre').css({"border-color": "red", "box-shadow": "1px 1px 2px red"});

   if ((title) && (genre)){
     $('#create-new-song').attr('disabled', 'disabled');
     createSong(title, genre);
   }
}
function createSong(title, genre){
  duration = Math.floor(Math.random() * 400000) + 244900;
  song = {title: title, duration: duration, genre: genre};
  
  $.ajax({
       type: "POST",
       url: window.location.pathname+"/songs.json",
       data: JSON.stringify({
           song: song
       }),
       contentType: "application/json",
       dataType: "json"
   })
   .success(function(data){
     song = data;
     title = $('<h1>').addClass("tag-title").text(song.title);
     duration = $('<h1 id="duration">').text(song.duration);
     playBtn = $('<a>').addClass('btn btn-primary').append($('<span>').addClass('glyphicon glyphicon-play-circle'));
     deleteBtn = $('<a id="'+song.id+'">').addClass('btn btn-default pull-right delete-song').append($('<span>').addClass('glyphicon glyphicon-trash'));
     genre =$('<a>').addClass('btn btn-default pull-left').text(song.genre);
     boxContent = $('<div>').addClass('box-content');
     boxContent.append(title, $('<hr />'), duration, $('<br />'), playBtn, $('<br />'), $('<hr />'), deleteBtn, genre);
     boxContainer = $('<div>').addClass('box').css('border-color', 'green');
     boxContainer.append(boxContent);
     songElement = $('<div>').addClass('col-md-4 text-center');
     songElement.append(boxContainer);
     $('.row.songs').append(songElement);
     setTimeout(function () {
       $('.page-wrapper').fadeOut('slow');
       $('.new-song').fadeOut('slow');
     }, 500);
    //
   })
   .fail(function(data){
     console.log(data);
   });
}

// DELETE ALL

function deleteSongs(event){
  event.preventDefault();
  $.each($('.song'), function(index, song){
    $song = $(song);
    songId = $song.attr('id');
    deleteSong(songId);
  });
}
