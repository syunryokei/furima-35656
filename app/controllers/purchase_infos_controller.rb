class PurchaseInfosController < ApplicationController

  def index
    @item = Item.find_by!(params[:id])
  end
  
end
