class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.time = (@post.finish_time - @post.start_time) / 3600
    @post.save
    redirect_to user_path(current_user.id)
  end

  def index
    @posts = current_user.posts.page(params[:page]).per(5)
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:day, :start_time, :finish_time, :place, :other_place, :content)
  end
end
