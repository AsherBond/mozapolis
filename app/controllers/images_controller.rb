class ImagesController < ApplicationController
  def sort
    params[:image].each_with_index do |id, index|
      Image.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  def index
    @gallery = Gallery.find(params[:gallery_id])
    @images = @gallery.images.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])
    # Comments
    @commentable = @image
    @comments = @commentable.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.build(params[:image])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
    @gallery = Gallery.find(@image.gallery_id)
  end

  # POST /images
  # POST /images.json
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.build(params[:image])
    
    if @image.save
      flash[:notice] = "Successfully created image."
      redirect_to gallery_images_path(@gallery)
    else
      render :action => 'new'
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to gallery_images_path(@image.gallery_id), notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { 
        flash[:error] = "Image destroyed."
        redirect_to gallery_images_path(@image.gallery_id) 
      }
      format.json { head :no_content }
    end
  end
end
