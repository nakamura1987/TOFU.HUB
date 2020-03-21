class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop, notice: "画像を登録しました。"
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @Sho = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to @shop, notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:store_name, :address, :phone_number, :open_hour, :image)
  end

end
