class SaveDatasController < ApplicationController
  before_action :authenticate_user!

  def new
    @save_data = SaveData.new
    @user = User.find(params[:user_id])
  end

  def create
    @save_data = current_user.save_datas.new(save_data_params)
    @save_data.time = (@save_data.finish_time - @save_data.start_time) / 3600
    @save_data.save
    redirect_to user_path(current_user.id)
  end

  def index
    @user = User.find(params[:user_id])
    @save_datas = SaveData.where(user_id: @user.id).page(params[:page]).per(5)
  end

  def index_post
    @user = User.find(params[:user_id])
    @save_datas = SaveData.where(release: true).where(user_id: @user.id).page(params[:page]).per(5)
  end

  def show
    @save_data = SaveData.find(params[:id])
    @comment = current_user.comments.new #コメント投稿用のモデル
    @comments = @save_data.comments.all #コメント表示用のモデル
  end

  def show_image
    @save_data = current_user.save_datas.find(params[:id])
  end

  def edit
    @save_data = current_user.save_datas.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @save_data = current_user.save_datas.find(params[:id])
    @save_data.update(save_data_params)
    redirect_to user_save_datas_path(current_user)
  end

  def destroy
    @save_data = current_user.save_datas.find(params[:id])
    @save_data.destroy
    redirect_to user_save_datas_path(current_user)
  end

  private
  def save_data_params
    params.require(:save_data).permit(:image, :day, :start_time, :finish_time, :place, :other_place, :content, :release)
  end
end
