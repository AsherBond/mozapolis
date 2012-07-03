class ArticlesController < ApplicationController
  def sort
    params[:article].each_with_index do |id, index|
      Article.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  def index
    @articles = Article.where(:artist_id => current_artist).order(:position)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end
  def albums
  end

  def show
    @article = Article.find(params[:id])
    @artist = @article.artist

    # Comments
    @commentable = @article
    @comments = @commentable.comments
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  def new
    @artist = current_artist
    @article = @artist.articles.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  def create
    @artist = current_artist
    @article = @artist.articles.build(params[:article])
    if @article.save
      flash[:notice] = "<i class='icon-plus'></i> You have created a article succesfully. Wasn't that easy?".html_safe
      redirect_to articles_url
    else
      render :action => 'new'
    end
  end

  def edit
    article = Article.find(params[:id])
    if article.artist_id == current_artist.id
      @article = article
    else
      flash[:error] = "<h3><i class='icon-eye-open'></i> Don't be sneaky...! I'm watching you now.</h3>".html_safe
      redirect_to articles_url
    end
  end

  def update
    article = Article.find(params[:id])
    if article.artist_id == current_artist.id
      @article = article
      respond_to do |format|
        if @article.update_attributes(params[:article])
          format.html { redirect_to @article, notice: '<i class="icon-edit"></i> Article was successfully updated.'.html_safe }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "<h3><i class='icon-eye-open'></i> Don't be sneaky...! I'm watching you now.</h3>".html_safe
      redirect_to articles_url
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
