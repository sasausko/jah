class PagesController < ApplicationController
  def home
    @articles = Article.order(created_at: :desc).limit(3)
    @latest_articles = Article.order(created_at: :desc).limit(5)
  end

  def about
  end

  def terms
  end

  def donate
  end
end
