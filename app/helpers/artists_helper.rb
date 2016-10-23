module ArtistsHelper

  def genre artist
    !artist.songs[0].nil? ? artist.songs[0].genre : "undefined"
  end

  def artist_photo artist
    !artist.photo.nil? ? image_tag(artist.photo, class: "img-circle img-responsive") : image_tag("https://a2ua.com/singer/singer-003.jpg", class: "img-circle img-responsive")
  end
end
