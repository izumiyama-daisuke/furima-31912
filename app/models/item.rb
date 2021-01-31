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
    validates :image
  end

  #PRICE_REGEX = /\A[0-9]+\z/.freeze
  #PRICE_REGEX = /\A[0-9]+\z/.freeze
  #alidates :price, presence: true, inclusion: {in: 300..9999999 }, format: { with: /\A[0-9]+\z/, message: '半角（数字）を使用してください' }
  validates :price, presence: true, inclusion: {in: 300..9999999 }
  #validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }

  
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
end
