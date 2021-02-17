class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    @item = Item.find(params[:item_id])           ##  Pay.jpでpriceを送信するため
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])         ##  購入ページの写真表示のため
      render action: :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,           # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
