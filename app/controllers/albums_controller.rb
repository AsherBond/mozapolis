class AlbumsController < ApplicationController
  impressionist :unique => [:controller_name, :action_name, :session_hash], :actions => [:show]
  def sort
    params[:album].each_with_index do |id, index|
      Album.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end


  def upvote
    album = Album.find(params[:album_id])
    
    vote_up_msg   = "<i class='icon-thumbs-up'></i> <strong>#{album.artist.artist_name}</strong> thanks you for voting <strong>#{album.title}</strong> up.".html_safe
    vote_already  = "<i class='icon-remove'></i> You have already voted for <strong>#{album.title}</strong>.".html_safe

    if artist_signed_in?
      # Check if they voted already.
      if current_artist.voted_on?(album)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the album.
        current_artist.vote_for(album)   
        redirect_to :back, :notice => vote_up_msg
      end

    elsif fan_signed_in? 

      # Check if they voted already.
      if current_fan.voted_on?(album)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the album.
        current_fan.vote_for(album)   
        redirect_to :back, :notice => vote_up_msg
      end
    end

  end

  def downvote
    album = Album.find(params[:album_id])

    vote_down_msg = "<i class='icon-thumbs-down'></i> <strong>#{album.artist.artist_name}</strong> does not like you for voting <strong>#{album.title}</strong> down.".html_safe
    vote_already  = "<i class='icon-remove'></i> You have already voted for <strong>#{album.title}</strong>.".html_safe

    if artist_signed_in?
      # Check if they voted already.
      if current_artist.voted_on?(album)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the album.
        current_artist.vote_against(album)   
        redirect_to :back, :notice => vote_down_msg
      end

    elsif fan_signed_in? 
      
      # Check if they voted already.
      if current_fan.voted_on?(album)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the album.
        current_fan.vote_against(album)   
        redirect_to :back, :notice => vote_down_msg
      end
    end

  end

  def unvote
    album = Album.find(params[:album_id])

    vote_removed = "<i class='icon-remove'></i> Vote removed!".html_safe
    vote_never   = "<i class='icon-flag'></i> You never voted!".html_safe

    if artist_signed_in?
      if current_artist.voted_on?(album)
        current_artist.unvote_for(album)
        flash[:notice] = vote_removed
        redirect_to :back
      else
        flash[:error] = vote_never
        redirect_to :back
      end
    elsif fan_signed_in?
      if current_fan.voted_on?(album)
        current_fan.unvote_for(album)
        flash[:notice] = vote_removed
        redirect_to :back
      else
        flash[:error] = vote_never
        redirect_to :back
      end
    end
  end

  def index
    @albums = current_artist.albums.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  def show
    @album = Album.find(params[:id])
    impressionist(@album, :unique => [:controller_name, :action_name, :session_hash])
    @artist = @album.artist
    @songs = @album.songs.order(:position)

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
    album = Album.find(params[:id])
    if album.artist_id == current_artist.id
      @album = album
    else
      flash[:error] = "<h3><i class='icon-eye-open'></i> Don't be sneaky...! I'm watching you now.</h3>".html_safe
      redirect_to albums_url
    end
  end

  def update
    album = Album.find(params[:id])
    if album.artist_id == current_artist.id
      @album = album
      respond_to do |format|
        if @album.update_attributes(params[:album])
          format.html { redirect_to @album, notice: "<i class='icon-picture'></i> Your album has been updated!".html_safe }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "<h3><i class='icon-eye-open'></i> Don't be sneaky...! I'm watching you now.</h3>".html_safe
      redirect_to albums_url
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
