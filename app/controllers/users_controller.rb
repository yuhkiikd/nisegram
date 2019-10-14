class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy, :likes]
  before_action :ensure_current_user, only: [:edit, :update, :destory]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
      flash[:success] = "ユーザー登録が完了しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "ユーザー情報を更新しました！"
    else
      render :edit
    end
  end

  def destroy
  end

  def likes
    @favorite = @user.favorites
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