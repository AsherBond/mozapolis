class ArtistsController < ApplicationController

  # load_and_authorize_resource :only =>  [:albumdashboard, :videodashboard, :songdashboard]

  def index 
    #gon.users = User.all.map &:artist_name
  	@artists = Artist.text_search(params[:query]).page(params[:page]).per_page(3)
    render :layout => 'search'
  end

  def show

    @artist = Artist.find(params[:id])

    @albums = @artist.albums
    @videos = @artist.videos
    @articles = @artist.articles
    @galleries = @artist.galleries
    @events = @artist.events

    first_album = Album.where(:artist_id => @artist.id).order(:position).first
    @songs = first_album.songs

    @commentable = @artist
    @comments = @commentable.comments
    @comment = Comment.new

    #@photos = @artist.photos
    #@events = @artist.events
    render :layout => 'artist_profile'

  end

end