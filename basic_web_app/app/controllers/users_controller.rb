class UsersController < ApplicationController
  def index

  end

  def show
  	@user = User.find(params[:id])
  	current_user
  end

  def create
  	@user = User.new(fname: params[:user][:fname],
  					lname: params[:user][:lname],
  					email: params[:user][:email],
  					password: params[:user][:password])
  	if @user.save
  		session[:user_id] = @user.user_id
  		flash[:notice] = "You're Stuck With Us Now"
  	else
  		flash[:alert] = "Last Chance To Turn Away"
  	end
  		redirect_to "/users"
  end
end
