class SearchesController < ApplicationController
  before_action :authenticate_user!

  def finder

  end

  def user_result
    @range = params[:range]
    word = params[:keyword]
    @users = User.looks(@range, word).page(params[:page]).per(10)
  end

  def post_result
    @range = params[:range]
    word = params[:keyword]
    @save_datas = SaveData.where(release: true).order(created_at: :desc).looks(@range, word).page(params[:page]).per(10)
  end

end
