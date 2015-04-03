class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    # @articles = Article.all.reverse
    @articles = Article.search "vitae"
    # articles = Article.search "dolores", fields: [{title: :word}]
    # @articles = Article.search(query: {match: {'title' => 'lorem'}})
    # render json: Article.search('vitae').map(&:description)
    # render json: Article.search(query: {match: {title: 'vitae'}})
    render json: Article.search('vitae', load: false)

    # binding.pry
    # render json: articles
    # render json: format_result(articles)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.new
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
      params.require(:article).permit(:title, :description, :user_id, picture_attributes: [:photo])
    end

    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def format_result(result)
      result.response['hits']['hits'].map { |item| item }
    end
end