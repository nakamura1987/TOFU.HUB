class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to @shop
  end

  private
  def post_params
    params.require(:shop).permit(:store_name, :address, :phone_number, :open_hour, :image)
  end

end
