class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @save_data = current_user.save_datas.last
    @posts = current_user.posts.last(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :age, :learning_content)
  end
end
