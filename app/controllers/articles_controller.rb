class ArticlesController < ApplicationController
  def index
  	@articles = Article.all.reverse
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.new(article_params)

  	if @article.save
  		redirect_to @article
  	else
  		render 'new'
  	end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash["notice"] = "Artigo alterado com sucesso"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.delete
    flash["notice"] = "Artigo deletado"
    redirect_to root_path
  end

  private
  	def article_params
  		params.require(:article).permit(:title, :description, :photo, :user_id)
  	end
end