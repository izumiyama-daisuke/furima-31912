class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to action: :index
    else
      render action: :index
    end
  end
  #def create
    #@user = User.new(donation_params)
    #if @user.save
      #redirect_to action: :index
    #else
      #render action: :new
    #end
  #end

  private

  def order_params
    #params.require(:order).permit(:item_id).merge(user_id: current_user.id)
    #params.require(:order).permit().merge(user_id: current_user.id, item_id: :item_id)
    #params.require(:order).merge(user_id: current_user.id, item_id: :item_id)
    params.permit(:item_id).merge(user_id: current_user.id)
  end
end
