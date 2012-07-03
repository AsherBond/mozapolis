class SongsController < ApplicationController
  def sort
    params[:song].each_with_index do |id, index|
      Song.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  def upvote
    song = Song.find(params[:song_id])    
    vote_up(song)
  end

  def downvote
    song = Song.find(params[:song_id])
    vote_down(song)

  end

  def unvote
    song = Song.find(params[:song_id])
    remove_vote(song)
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
