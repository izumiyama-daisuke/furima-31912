class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @item = Item.all.order(created_at: :desc)
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

  def edit
  end




  #def edit
  #end

  #def update
    #@prototype = Prototype.find(params[:id])
    #@prototype.update(prototype_params)
    #if @prototype.save
      #redirect_to "/prototypes/#{@prototype.id}"
    #else
      #render "edit"
    #end
  #end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :category_id, :state_id, :delivery_fee_id,
                                 :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end
