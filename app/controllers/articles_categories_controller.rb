class ArticlesCategoriesController < ApplicationController
  def index
    @categories = ArticlesCategory.arrange(order: :name)  # Відображає дерево категорій
  end

  def show
    @category = ArticlesCategory.find(params[:id])
    @articles = @category.articles.order(created_at: :desc)
  end

  def new
    @category = ArticlesCategory.new
    @parent_categories = ArticlesCategory.where(ancestry: nil)  # Кореневі категорії
  end

  def create
    @category = ArticlesCategory.new(category_params)
    if @category.save
      redirect_to articles_categories_path, notice: "Категорія успішно створена."
    else
      @parent_categories = ArticlesCategory.where(ancestry: nil)
      render :new
    end
  end

  private

  def category_params
    params.require(:articles_category).permit(:name, :parent_id)  # parent_id для деревовидної структури
  end
end
