class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:articles_category).order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = ArticlesCategory.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Стаття успішно створена."
    else
      @categories = ArticlesCategory.all
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :articles_category_id)
  end
end
