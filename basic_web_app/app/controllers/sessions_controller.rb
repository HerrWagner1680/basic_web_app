class SessionsController < ApplicationController
  def create
  	@users = User.where(email: params[:email]).first

  	if @user && @user.password == params[:password]
  		session[:user_id] = @user.id
  		flash[:notice] = "Successfully Logged In"
  	else
  		flash[:alert] = "Your credentials do not match"
  	end

  	redirect_to "/users/#{ @user.id }"
  end

  def new
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/users"
  end
end
