class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end
  #def create
  #  @article = Article.new(article_params)
  #  if @article.save
  #    redirect_to root_path
  #  else
  #    render :new
  #  end
  #end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
  ####アクティブストレージの記載です変更してください
  #def message_params
   # params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  #end
end
