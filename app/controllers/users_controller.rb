class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update, :destory]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました！"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました！"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def ensure_current_user
    unless logged_in? && current_user.id == @user.id
      redirect_to images_path
    end
  end
end