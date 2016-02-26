class CommentsController < ApplicationController
  # before_action :set_article, only: :create
  after_action :set_parent, only: :create

  def new
    @reply_comment = Comment.find(params[:comment_id])
    @comment = Comment.build_from( @reply_comment, current_user.id, '' )
  end

  def create
    @comment = Comment.create( comment_params )

    respond_to do |format|
      format.js
      format.html
  
    end
  end

  def comment_params
  	params.require(:comment).permit(:commentable_id, :commentable_type, :user_id, :parent_id, :body)
  end

  def set_article
  	@article = Article.find(params[:comment][:commentable_id])
  end

  def set_parent
    c = Comment.last
    c.update parent_id: :commentable_id
  end
end
