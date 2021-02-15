class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    #@order = Order.all
    @item_order = ItemOrder.new##ためし
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      #@item_order = ItemOrder.new##ためし
      @item = Item.find(params[:item_id])##購入ページの写真表示のため
      #render root_path
      render action: :index
    end
  end

  private

  def order_params
    #params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :telephone, :item_id).merge(user_id: current_user.id)
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end#require(:item_order).
end
