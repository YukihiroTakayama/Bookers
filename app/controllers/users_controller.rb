# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    return render action: :edit unless @user.update(user_params)

    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
  end

  private

  def correct_user
    redirect_to user_path(current_user.id) if current_user.id != params[:id].to_i
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
