class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address1, :address2, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A[0-9]{1,11}\z/, message: 'Not under 11 number' }

    validates :token
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be other_than: 1" }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2,
                   telephone: telephone, order_id: order.id)
  end
end
