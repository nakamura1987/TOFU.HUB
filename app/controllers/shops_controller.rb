class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shop_path, notice: "画像を登録しました。"
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end


  private
  def shop_params
    params.require(:shop).permit(:store_name, :address, :phone_number, :open_hour, :image)
  end

end
