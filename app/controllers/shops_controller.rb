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
      redirect_to @shop, notice: "店舗情報を登録しました。"
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
      redirect_to @shop, notice: "店舗情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @shop = shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path, notice: "店舗情報を削除しました。"
  end

  private
  def shop_params
    params.require(:shop).permit(:store_name, :address, :phone_number, :open_hour, :image, :map_url)
  end

end
