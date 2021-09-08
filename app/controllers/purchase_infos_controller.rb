class PurchaseInfosController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def new
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_info_params)

    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end

  end
  

  private
  def purchase_info_params
    params.require(:purchase_address).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefectures_id).merge(user_id: current_user.id, item_id: @item.id)
  end
end
