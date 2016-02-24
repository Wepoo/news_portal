class CommentsController < ApplicationController
  # before_action :set_article, only: :create
  def create
    @comment = Comment.create( comment_params )

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to current_user, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to current_user }
        #format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def comment_params
  	params.require(:comment).permit(:commentable_id, :commentable_type, :user_id, :body, :parent_id)
  end

  def set_article
  	@article = Article.find(params[:commentable_id])
  end

end
