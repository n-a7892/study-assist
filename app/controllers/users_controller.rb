class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @save_data = SaveData.where(user_id: @user.id).last
    @save_datas = SaveData.where(release: true).where(user_id: @user.id).first(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました。"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "更新できませんでした。"
      @user = User.find(params[:id])
      render :edit
    end
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings.page(params[:page]).per(10)
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(10)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :age, :learning_content)
  end
end
