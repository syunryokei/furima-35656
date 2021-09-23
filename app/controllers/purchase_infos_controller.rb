class PurchaseInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_purchase_address, only: [:index]

  def index
    if current_user.id == @item.user_id || @item.purchase_info != nil
      return redirect_to root_path
    end
  end
  
  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def set_purchase_address
    @purchase_address = PurchaseAddress.new
  end
end
