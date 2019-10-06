class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(image_id: params[:image_id])
    flash[:success] = "#{favorite.image.user.name}お気に入り登録しました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:success] = 'お気に入りを削除しました'
    redirect_back(fallback_location: root_path)
  end
end