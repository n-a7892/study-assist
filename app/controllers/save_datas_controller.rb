class SaveDatasController < ApplicationController
  def new
    @save_data = SaveData.new
  end

  def create
    @save_data = current_user.save_datas.new(save_data_params)
    @save_data.time = (@save_data.finish_time - @save_data.start_time) / 3600
    @save_data.save
    if params[:save_data][:post_new]
      render template: "posts/create"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @save_datas = current_user.save_datas.page(params[:page]).per(5)
  end

  def show
    @save_data = current_user.save_datas.find(params[:id])
  end

  def show_image
    @save_data = current_user.save_datas.find(params[:id])
  end

  def edit
    @save_data = current_user.save_datas.find(params[:id])
  end

  def update
    @save_data = current_user.save_datas.find(params[:id])
    @save_data.update(save_data_params)
    redirect_to save_datas_path
  end

  def destroy
    @save_data = current_user.save_datas.find(params[:id])
    @save_data.destroy
    redirect_to save_datas_path
  end

  private
  def save_data_params
    params.require(:save_data).permit(:image, :day, :start_time, :finish_time, :place, :other_place, :content)
  end
end
