class AlbumsController < ApplicationController

  def sort
    params[:album].each_with_index do |id, index|
      Album.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  def index
    @albums = Album.where(:artist_id => current_artist.id).order("position")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  def show
    @album = Album.find(params[:id])
    @artist = @album.artist
    @songs = @album.songs

    # Comments
    @commentable = @album
    @comments = @commentable.comments
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  def new
    @artist = current_artist
    @album = @artist.albums.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  def create
    @artist = current_artist
    @album = @artist.albums.build(params[:album])
    if @album.save
      flash[:notice] = "<i class='icon-picture'></i> Your album has been created. You can add songs below.".html_safe
      redirect_to albums_url
    else
      render :action => 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: "<i class='icon-picture'></i> Your album has been updated!".html_safe }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end
