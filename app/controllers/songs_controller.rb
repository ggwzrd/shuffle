class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_artist, only: [:create]

  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.build(song_params)
    respond_to do |format|
      if @song.save
        format.html { redirect_to @artist.id, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :ok, location: @artist}
      else
        format.html { render @artist.id }
        format.json { render @artist.id, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to artist_path(song.artist), notice: 'Song was successfully removed.' }
      format.json { head :no_content }
    end
  end
  private

  def song_params
      params.require(:song).permit(:title, :duration, :genre)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
  # Use callbacks to share common setup or constraints between actions.
   def set_song
     @song = Song.find(params[:id])
   end
end
