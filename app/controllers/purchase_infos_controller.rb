class PurchaseInfosController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase_info != nil
      return redirect_to root_path
    end
    @purchase_address = PurchaseAddress.new
  end

  def new
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_info_params)

    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render :index
    end

  end
  

  private
  def purchase_info_params
    params.require(:purchase_address).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefectures_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_info_params[:token],
      currency: 'jpy'
      )
  end
  
end
