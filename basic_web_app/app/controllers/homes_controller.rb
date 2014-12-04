class HomesController < ApplicationController

	def index
		@post = Post.all
		@user = User.find(params[:id])
	end

end


