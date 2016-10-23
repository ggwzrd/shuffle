class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to artist_path(song.artist), notice: 'Song was successfully removed.' }
      format.json { head :no_content }
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
   def set_song
     @song = Song.find(params[:id])
   end
end
