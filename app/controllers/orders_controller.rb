class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @order = Order.all
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def create
  #  @order = Order.new(order_params)
  #  @order.save
  #  Address.create(address_params)
  #  redirect_to root_path(order_params)


    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])##ためし
      render action: :index
      #render root_path
      #render items/:item_id/orders(order_params)
    end
  end

  private

#  def order_params
#    params.permit(:item_id).merge(user_id: current_user.id)
#  end

#  def address_params
#    params.permit(:postal_code, :prefecture_id, :city, :address1, :address2, :telephone, :item_id)
#  end
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address1, :address2, :telephone, :item_id).merge(user_id: current_user.id)
  end#require(:item_order).
end
