class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]

  def index
    @images = Image.all.order(id: 'DESC')
  end

  def new
    if params[:back]
      @image = Image.new(image_params)
    else
      @image = Image.new
    end
  end

  def confirm
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    render :new if @image.invalid?
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @image.save
        flash[:success] = '記事を作成しました！'
        redirect_to images_path
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @image.update(image_params)
      flash[:success] = '記事を編集しました！'
      redirect_to images_path
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    flash[:success] = '記事を削除しました！'
    redirect_to images_path
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image, :image_cache, :content)
  end

  def ensure_current_user
    unless logged_in? && current_user.id == @image.user_id
      redirect_to images_path
    end
  end
end