class ArtistsController < ApplicationController

  # load_and_authorize_resource :only =>  [:albumdashboard, :videodashboard, :songdashboard]
  impressionist :unique => [:controller_name, :action_name, :session_hash], :actions => [:show]
  def index 
    #gon.users = User.all.map &:artist_name
  	@artists = Artist.text_search(params[:query]).page(params[:page]).per_page(3)
    render :layout => 'search'
  end

  def show
    # Get the artists
    @artist = Artist.find(params[:id])
    # Track views
    impressionist(@artist, :unique => [:controller_name, :action_name, :session_hash])

    # Load artist engines
    @albums    = @artist.albums.order(:position)
    @videos    = @artist.videos.order(:position)
    @articles  = @artist.articles.order(:position)
    @galleries = @artist.galleries.order(:position)
    @events    = @artist.events.order(:position)

    # For the player
    unless @albums.empty?
      first_album = Album.where(:artist_id => @artist.id).order(:position).first
      @songs = first_album.songs
    end

    # Comments
    @commentable = @artist
    @comments    = @commentable.comments
    @comment     = Comment.new

    #@photos = @artist.photos
    #@events = @artist.events
    render :layout => 'artist_profile'

  end

end