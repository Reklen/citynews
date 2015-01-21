class ArticlesController < ApplicationController
  before_action :authenticate_user!, execpt: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
  	@articles = Article.all.reverse
  end

  def show
  end

  def new
  	@article = Article.new
  end

  def edit
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
    if @article.update(article_params)
      flash["notice"] = "Artigo alterado com sucesso"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.delete
    flash["notice"] = "Artigo deletado"
    redirect_to root_path
  end

  private
  	def article_params
  		params.require(:article).permit(:title, :description, :photo, :user_id)
  	end

    def set_article
      @article = Article.find(params[:id])
    end
end