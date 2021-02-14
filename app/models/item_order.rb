class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address1, :address2, :telephone, :item_id, :user_id


  with_options presence: true do

    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address1
    validates :telephone

    validates :item_id
    validates :user_id

  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    #Order.create(item_id: item_id).merge(user_id: current_user.id)
    Order.create(item_id: item_id, user_id: user_id)#.merge(user_id: current_user.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, telephone: telephone, item_id: item_id)
  end

end