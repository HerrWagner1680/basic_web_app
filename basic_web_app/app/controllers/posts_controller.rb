class PostsController < ApplicationController
  def index
  	@post = Post.all
  end

  def create
  	@post = Post.new(text: params[:post][:text],
  					user_id: session[:user_id])
  	if @post.save
  		flash[:notice] = "Post Created"
  	else
  		flash[:alert] = "Try Again"
  	end
  	redirect_to "/posts"
  end

  def show
  	@post = Post.find(params[:id])
  	# @current_user = User.find(session[:user_id])
  end
end
