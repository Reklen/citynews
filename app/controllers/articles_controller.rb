class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    render 'application/index'
  end

  def search
    render json: Article.search_by_location(
      params[:latitude],
      params[:longitude],
      params[:distance]
    )
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.new
    @article.build_location

    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      Article.reindex
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
    params.require(:article)
      .permit(:title, :description, :user_id,
              location_attributes: [:latitude, :longitude, :city, :state, :country],
              picture_attributes: [:photo])
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end