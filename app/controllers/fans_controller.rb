class FansController < ApplicationController

  # load_and_authorize_resource :only =>  [:albumdashboard, :videodashboard, :songdashboard]
  impressionist :unique => [:controller_name, :action_name, :session_hash], :actions => [:show]
  def index 
    #gon.users = User.all.map &:artist_name
  	@artists = Artist.text_search(params[:query]).page(params[:page]).per_page(3)
    render :layout => 'search'
  end

  def show

    @fan = Fan.find(params[:id])
    impressionist(@fan, :unique => [:controller_name, :action_name, :session_hash])


    @commentable = @fan
    @comments = @commentable.comments
    @comment = Comment.new

  end

end