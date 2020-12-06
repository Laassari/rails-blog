# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update edit destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def edit; end

  def new; end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'The article has been created succesfully'
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'The article has been updated succesfully'
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

  def set_article
    @article ||= Article.find params[:id]
  end
end
