class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
  	@articles = Article.all.reverse
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  	@article = current_user.articles.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)

  	if @article.save
  		redirect_to @article
  	else
      flash[:notice] = "A notícia não pode ser salva"
  		render 'new'
  	end
  end

  def update
    if @article.update(article_params)
      flash["notice"] = "Notícia alterada com sucesso"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.delete
    flash["notice"] = "Notícia apagada"
    redirect_to root_path
  end

  private
  	def article_params
      params.require(:article).permit(:title, :description, :user_id, picture_attributes: [:photo])
  	end

    def set_article
      @article = current_user.articles.find(params[:id])
    end
end