class ShopsController < ApplicationController
before_action :set_shop, only: [ :show, :edit, :update, :destroy]
  def index
    @shops = Shop.all
    @shops = Shop.page(params[:page])
    @q = Shop.ransack(params[:q])
    @shops = @q.result
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop, notice: "店舗情報を登録しました。"
    else
      @shops = Shop.page(params[:page]).per(16)
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop, notice: "店舗情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path, notice: "店舗情報を削除しました。"
  end

  private
  def shop_params
    params.require(:shop).permit(:store_name, :address, :phone_number, :open_hour, :image, :map_url)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
