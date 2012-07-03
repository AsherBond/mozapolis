class PtracksController < ApplicationController
  def sort
    params[:ptrack].each_with_index do |id, index|
      Ptrack.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  def addsong
    song_id = params[:song_id]
    playlist_id = params[:playlist_id]

    playlist = Playlist.find(params[:playlist_id])
    ptrack = playlist.ptracks.build

    ptrack = playlist.ptracks.build(:song_id => song_id)

    if ptrack.save
      flash[:notice] = "<i class='icon-plus'></i> <i class='icon-reorder'></i> Song added to the playlist '#{playlist.name}'.".html_safe
      redirect_to :back
    else
      render :action => 'new'
    end
  end

end
