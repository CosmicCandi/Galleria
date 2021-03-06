class UsersController < ApplicationController

  def index
    unless current_user
      render :marketing
    else
      render 'galleries/index'
    end
  end

  def new
    @user = User.new
    render :signup
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup(@user).deliver
      session[:user_id] = @user.id
      flash[:success] = "Account successfully created!"
      redirect_to :root
    else
      render :signup
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
