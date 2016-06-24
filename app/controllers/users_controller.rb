class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  # def create
  #   @user = User.new(user_params)    
  #   if @user.save
  #     UserMailer.registration_confirmation(@user).deliver
  #     flash[:success] = "Please confirm your email address to continue"
  #     redirect_to root_url
  #   else
  #     flash[:error] = "Ooooppss, something went wrong!"
  #     render 'new'
  #   end
  # end
end
