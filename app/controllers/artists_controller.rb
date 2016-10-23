class ArtistsController < ApplicationController

  def index
    if params[:order_by]
      @artists = Artist.all.order_by params[:order_by]
    else
      @artists = Artist.all
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
