class User < ApplicationRecord
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'に全角文字を使用してください' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'に全角文字カタカナを使用してください' } do
    validates :first_kana, presence: true
    validates :last_kana, presence: true
  end
  validates :birthday, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
