class HomesController < ApplicationController

	def index
		@post = Post.where(user_id: session[:user_id])
		@user = User.where(id: session[:user_id])
	end

end


