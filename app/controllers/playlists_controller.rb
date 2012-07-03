class PlaylistsController < ApplicationController
  def sort
    params[:playlist].each_with_index do |id, index|
      Playlist.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  def index
    @playlists = current_fan.playlists.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlists }
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @ptracks = @playlist.ptracks

    # Comments
    # @commentable = @playlist
    # @comments = @commentable.comments
    # @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playlist }
    end
  end

  def new
    @fan = current_fan
    @playlist = @fan.playlists.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playlist }
    end
  end

  def create
    @fan = current_fan
    @playlist = @fan.playlists.build(params[:playlist])
    if @playlist.save
      flash[:notice] = "You have created a playlist succesfully. Wasn't that easy?"
      redirect_to playlists_url
    else
      render :action => 'new'
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])

    respond_to do |format|
      if @playlist.update_attributes(params[:playlist])
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    respond_to do |format|
      format.html { 
        flash[:error] = "Playlist destroyed."
        redirect_to playlists_url 
      }
      format.json { head :no_content }
    end
  end
end


