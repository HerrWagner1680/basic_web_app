class CommentsController < ApplicationController
  def index
  end

  def create
  	@comment = Comment.new(comment_params)
  	@comment.user_id = session[:user_id]
    @comment.post_id = params[:post_id]
  	if @comment.save
  		flash[:notice] = "Comment Created"
  	else
  		flash[:alert] = "Try Again"
  	end
  	redirect_to "/posts"
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
