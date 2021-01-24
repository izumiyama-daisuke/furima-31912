require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目を適正に入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが登録済みのアドレスと同じでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが”＠”を含んでいないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角では登録できない' do
        @user.password = '1ａａａａａ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが確認用を含めて２回入力しないと登録できない' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'passwordとpassword（確認用）が同じ出ないと登録できない' do
        user = @user
        user.password = '00000a'
        user.password_confirmation = '00000b'
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana に全角（カタカナ）を使用してください')
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana に全角（カタカナ）を使用してください')
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）を使用してください')
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）を使用してください')
        @user.first_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）を使用してください')
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）を使用してください')
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）を使用してください')
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）を使用してください')
      end

      it 'first_kanaが全角（カタカナ）でないと登録できない' do
        @user.first_kana = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana に全角（カタカナ）を使用してください')
        @user.first_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana に全角（カタカナ）を使用してください')
        @user.first_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana に全角（カタカナ）を使用してください')
      end

      it 'last_kanaが全角（カタカナ）でないと登録できない' do
        @user.last_kana = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana に全角（カタカナ）を使用してください')
        @user.last_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana に全角（カタカナ）を使用してください')
        @user.last_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana に全角（カタカナ）を使用してください')
      end
    end
  end
end
