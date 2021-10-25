class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = current_user.comments.new(comment_params)
    comment.article_id = article.id
    comment.user_id = current_user.id
    comment.save
    @new_article_comment = comment
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    @comment_id = params[:id]
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
