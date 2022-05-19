class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(save_data_id: params[:save_data_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @save_data = SaveData.find(params[:save_data_id])
    @favorite = current_user.favorites.find_by(save_data_id: @save_data.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
