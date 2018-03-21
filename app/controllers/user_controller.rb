class UserController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def edit
    
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :fullname, :image, :place, :school, :description, :motto, :twitter_url, :facebook_url, :github_url)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def current_user?(user)
      user == current_user
    end
end
