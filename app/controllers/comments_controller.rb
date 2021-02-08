class CommentsController < ApplicationController
  before_action :check_authenticity!, except: %i[index show]

  def show; end

  def create
    article = Article.find params[:article_id]

    @comment = article.comments.create(
      body: comment_params[:body],
      user_id: current_user.id
    )

    redirect_to article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
