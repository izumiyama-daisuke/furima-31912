class User < ApplicationRecord
  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :password_confirmation, presence: true

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  validates_format_of :first_name, presence: true, with: NAME_REGEX, message: '全角（漢字・ひらがな・カタカナ）を使用してください'
  validates_format_of :last_name, presence: true, with: NAME_REGEX, message: '全角（漢字・ひらがな・カタカナ）を使用してください'

  NAME_KANA_REGEX = /\A[ァ-ヶ一]+\z/.freeze
  validates_format_of :first_kana, presence: true, with: NAME_KANA_REGEX, message: 'に全角（カタカナ）を使用してください'
  validates_format_of :last_kana, presence: true, with: NAME_KANA_REGEX, message: 'に全角（カタカナ）を使用してください'

  validates :birthday, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
