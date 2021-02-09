class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    #@item = Item.find(params[:id])
  end
end
