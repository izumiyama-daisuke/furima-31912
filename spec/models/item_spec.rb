require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
    @item.user_id = @user.id
  end
  describe '商品出品機能' do
    context '商品が登録できるとき' do
      it '全ての項目を適正に入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が登録できないとき' do
      it '商品画像が空では登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像ファイルを入力してください')
      end
      it '商品名が空では登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品の説明が空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは数値で入力してください')
      end
      it '商品の状態が空では登録できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は数値で入力してください')
      end
      it '配送料の負担が空では登録できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は数値で入力してください')
      end
      it '発送元の地域が空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は数値で入力してください')
      end
      it '発送までの日数が空では登録できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は数値で入力してください')
      end
      it '価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('値段を入力してください')
      end
      it '価格の範囲が、¥300より安くては登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は一覧にありません')
      end
      it '価格が¥9,999,999より高くては登録できないこと' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は一覧にありません')
      end
      it '販売価格は全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は一覧にありません')
      end
      it '価格が半角英語では登録できないこと' do
        @item.price = 'aaaabbbb'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は一覧にありません')
      end
      it '価格が半角英数混合では登録できないこと' do
        @item.price = 'aaaa7777'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は一覧にありません')
      end
      it 'active_hash【カテゴリー】が【１】では登録できないこと' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it 'active_hash【商品の状態】が【１】では登録できないこと' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end
      it 'active_hash【配送料の負担】が【１】では登録できないこと' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end
      it 'active_hash【発送元の地域】が【１】では登録できないこと' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end
      it 'active_hash【発送までの日数】が【１】では登録できないこと' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end
    end
  end
end

#  テストで使用
#  bundle exec rspec spec/models/item_spec.rb
#  @item_order.errors.full_messages
