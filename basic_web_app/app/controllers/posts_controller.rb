class PostsController < ApplicationController
  def index
  	@post = Post.all
    @comment = Comment.all
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = session[:user_id]
  	if @post.save
  		flash[:notice] = "Post Created"
  	else
  		flash[:alert] = "Try Again"
  	end
  	redirect_to "/posts"
  end

  def new
    @post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  	@current_user = User.find(session[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
