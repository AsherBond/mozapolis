class Admin::ArticlesController < ApplicationController
	def index
		@articles = Article.all

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @articles }
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
	    redirect_to admin_articles_url
	  else
	    render :action => 'new'
	  end
	end

	def edit
	  @article = Article.find(params[:id])
	end

	def update
	  @article = Article.find(params[:id])

	  respond_to do |format|
	    if @article.update_attributes(params[:article])
          format.html { redirect_to @article, notice: '<i class="icon-edit"></i> Article was successfully updated.'.html_safe }
	      format.json { head :no_content }
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @article.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		respond_to do |format|
			format.html { redirect_to admin_articles_url }
			format.json { head :no_content }
		end
	end
end
