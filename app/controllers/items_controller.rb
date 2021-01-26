class ItemsController < ApplicationController
  def index
  end

  def new
  end


  private
  ####アクティブストレージの記載です変更してください
  #def message_params
   # params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  #end
end
