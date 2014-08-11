class UsersController < ApplicationController
  before_action :sign_in_user, only: [:edit, :update, :following , :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
    else
    	render 'new'
    end	
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end
