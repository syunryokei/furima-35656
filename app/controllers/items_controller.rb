class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_info, :price, :category_id, :condition_id, :postage_type_id,
                                 :prefectures_id, :delivery_days_id, :image).merge(user_id: current_user.id)
  end
end
