class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	current_user
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		flash[:notice] = "You're Stuck With Us Now"
  	else
  		flash[:alert] = "Last Chance To Turn Away"
  	end
  		redirect_to "/homes"
  end

  def new 
	@user = User.new
  end

private

def user_params
  params.require(:user).permit(:fname, :lname, :email, :password)
end
  
end
