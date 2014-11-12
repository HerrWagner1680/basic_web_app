class CommentsController < ApplicationController
  def index
  	@comment = Comment.all
  end

  def create
  	@comment = Comment.new(text: params[:comment][:text],
  					user_id: session[:user_id])
  	if @comment.save
  		flash[:notice] = "Comment Created"
  	else
  		flash[:alert] = "Try Again"
  	end
  	redirect_to "/posts"
  end

  def show
  	@comment = Comment.find(params[:id])
  	# @current_user = User.find(session[:user_id])
  end
end
