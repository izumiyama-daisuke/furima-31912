class Address < ApplicationRecord
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
