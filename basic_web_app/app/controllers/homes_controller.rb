class HomesController < ApplicationController

	def index
		@post = Post.where(user_id: session[:user_id])
		@user = session[:user_id]
		# @user = User.find(params[:id])
	end

end


