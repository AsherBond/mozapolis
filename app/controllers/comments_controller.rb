class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(params[:comment])

    if artist_signed_in?
    	@comment.poster_type = "artist"
    	@comment.artist_id = current_artist.id
    elsif fan_signed_in?
    	@comment.poster_type = "fan"
    	@comment.fan_id = current_fan.id
    end

    if @comment.save
      redirect_to @commentable, notice: "<i class='icon-comments'></i> Your comment has been posted!".html_safe
    else
      render :new
    end
  end


private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # def load_commentable
  #   klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end
end