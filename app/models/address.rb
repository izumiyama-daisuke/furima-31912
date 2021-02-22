class Address < ApplicationRecord
  # belongs_to :item
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
