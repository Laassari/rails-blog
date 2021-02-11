class LikesController < ApplicationController
  before_action :check_authenticity!, except: %i[index show]
  before_action :set_article, only: %i[create destroy]

  def create
    liked = current_user.liked?(@article)

    unless liked
      @article.likes.create('user_id': current_user.id)
    end

    redirect_to article_path(@article)
  end

  def destroy
    @article.likes.where('user_id': current_user.id).first.destroy

    redirect_to article_path(@article)
  end

  private
  def set_article
    @article ||= Article.find(params[:article_id])
  end
end
