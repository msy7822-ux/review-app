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

  def new 
    # newから新しいラーメン店情報を追加する際にからのインスタンスが必要
    @ramen_shop = RamenShop.new()
  end

  def create
    @ramen_shop = RamenShop.new(ramen_shop_params)

    if @ramen_shop.save
      redirect_to ramen_shops_path
    else
      render 'new'
    end
  end

  private

  def ramen_shop_params
    params.require(:ramen_shop).permit(:name)
  end
end
