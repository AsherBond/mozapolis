class Admin::GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @artist = @gallery.artist
    @images = @gallery.images

    # Comments
    @commentable = @gallery
    @comments = @commentable.comments
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  def new
    @artist = current_artist
    @gallery = @artist.galleries.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  def create
    @artist = current_artist
    @gallery = @artist.galleries.build(params[:gallery])
    if @gallery.save
      flash[:notice] = "You have created a gallery succesfully. Wasn't that easy?"
      redirect_to admin_galleries_url
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end
end
