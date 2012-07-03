class SongsController < ApplicationController
  def sort
    params[:song].each_with_index do |id, index|
      Song.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  def upvote
    song = Song.find(params[:song_id])
    album = song.album
    
    vote_up_msg   = "<i class='icon-thumbs-up'></i> <strong>#{album.artist.artist_name}</strong> thanks you for voting <strong>#{song.title}</strong> up.".html_safe
    vote_already  = "<i class='icon-remove'></i> You have already voted for <strong>#{song.title}</strong>.".html_safe

    if artist_signed_in?
      # Check if they voted already.
      if current_artist.voted_on?(song)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the song.
        current_artist.vote_for(song)   
        redirect_to :back, :notice => vote_up_msg
      end

    elsif fan_signed_in? 

      # Check if they voted already.
      if current_fan.voted_on?(song)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the song.
        current_fan.vote_for(song)   
        redirect_to :back, :notice => vote_up_msg
      end
    end

  end

  def downvote
    song = Song.find(params[:song_id])
    album = song.album
    
    vote_down_msg = "<i class='icon-thumbs-down'></i> <strong>#{album.artist.artist_name}</strong> does not like you for voting <strong>#{song.title}</strong> down.".html_safe
    vote_already  = "<i class='icon-remove'></i> You have already voted for <strong>#{song.title}</strong>.".html_safe

    if artist_signed_in?
      # Check if they voted already.
      if current_artist.voted_on?(song)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the song.
        current_artist.vote_against(song)   
        redirect_to :back, :notice => vote_down_msg
      end

    elsif fan_signed_in? 
      
      # Check if they voted already.
      if current_fan.voted_on?(song)
        # Redirect back with message.
        flash[:error] = vote_already
        redirect_to :back
      else
        # Vote for the song.
        current_fan.vote_against(song)   
        redirect_to :back, :notice => vote_down_msg
      end
    end

  end

  def unvote
    song = Song.find(params[:song_id])

    vote_removed = "<i class='icon-remove'></i> Vote removed!".html_safe
    vote_never   = "<i class='icon-flag'></i> You never voted!".html_safe

    if artist_signed_in?
      if current_artist.voted_on?(song)
        current_artist.unvote_for(song)
        flash[:notice] = vote_removed
        redirect_to :back
      else
        flash[:error] = vote_never
        redirect_to :back
      end
    elsif fan_signed_in?
      if current_fan.voted_on?(song)
        current_fan.unvote_for(song)
        flash[:notice] = vote_removed
        redirect_to :back
      else
        flash[:error] = vote_never
        redirect_to :back
      end
    end
  end

  def index
    @album = Album.find(params[:album_id])
    @songs = @album.songs.order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @album = Album.find(params[:album_id])
    @song = @album.songs.build(params[:song])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    @album = Album.find(@song.album_id)
  end

  # POST /songs
  # POST /songs.json
  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.build(params[:song])
    
    if @song.save
      flash[:notice] = "Successfully created song."
      redirect_to album_songs_path(@album)
    else
      render :action => 'new'
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to album_songs_path(@song.album_id), notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { 
        flash[:error] = "Song destroyed."
        redirect_to album_songs_path(@song.album_id) 
      }
      format.json { head :no_content }
    end
  end
end
