class VideosController < ApplicationController
  def sort
    params[:video].each_with_index do |id, index|
      Video.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  def index
    @videos = current_artist.videos.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  def show
    @video = Video.find(params[:id])
    @artist = @video.artist

    # Comments
    @commentable = @video
    @comments = @commentable.comments
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  def new
    @artist = current_artist
    @video = @artist.videos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  def create
    @artist = current_artist
    @video = @artist.videos.build(params[:video])
    if @video.save
      flash[:notice] = "You have created a video succesfully. Wasn't that easy?"
      redirect_to videos_url
    else
      render :action => 'new'
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end
end
