class StaticController < ApplicationController
  def home
  	@new_artists  = Artist.all
  	@new_albums   = Album.all
    @top_albums   = Album.tally.limit(10).order(:vote_count)
    @new_songs    = Song.all
    @top_songs    = Song.all
  	@new_comments = Comment.all
  end

  def about
  end

  def contact
  end

  def register
  end
  def notifications
    @notifications = Notification.where(:notify_user => current_artist.id).order("created_at desc")
  end
end
