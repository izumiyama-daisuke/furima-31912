class User < ApplicationRecord
  has_many :items
  has_many :orders

  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :password_confirmation
    validates :birthday
  end

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  validates_format_of :first_name, presence: true, with: NAME_REGEX, message: '全角（漢字・ひらがな・カタカナ）を使用してください'
  validates_format_of :last_name, presence: true, with: NAME_REGEX, message: '全角（漢字・ひらがな・カタカナ）を使用してください'

  NAME_KANA_REGEX = /\A[ァ-ヶ一]+\z/.freeze
  validates_format_of :first_kana, presence: true, with: NAME_KANA_REGEX, message: 'に全角（カタカナ）を使用してください'
  validates_format_of :last_kana, presence: true, with: NAME_KANA_REGEX, message: 'に全角（カタカナ）を使用してください'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
end
