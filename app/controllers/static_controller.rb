class StaticController < ApplicationController
  def home
  	@new_artists  = Artist.all
  	@new_albums   = Album.all
  	@new_songs    = Song.all
  	@new_comments = Comment.all
  end

  def about
  end

  def contact
  end

  def register
  end
end
