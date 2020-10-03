class RamenShopsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  # ログインしていないユーザーにはshowアクションにアクセスさせない

  def index
    @ramen_shops = RamenShop.all
  end

  def show
    @ramen_shop = RamenShop.find(params[:id])
    # rame_shopsのshowアクションからレビューの新規投稿を行うので空のモデルを設定
    @review = Review.new()
  end
end
