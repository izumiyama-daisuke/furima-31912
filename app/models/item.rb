class Item < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day
  
  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :item_name
    validates :description
    validates :price
  end
  
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
end
