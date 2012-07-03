class StaticController < ApplicationController
  def home
  	@new_artists  = Artist.all
  	@new_albums   = Album.all
    @top_albums   = Album.tally.limit(10).order(:vote_count)
    @new_songs    = Song.all
    @top_songs    = Song.tally.limit(10).order(:vote_count)
  	@new_comments = Comment.all
  end

  def about
  end

  def contact
  end

  def register
  end
end
