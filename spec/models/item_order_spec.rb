require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)

    sleep(0.1) ##  エラーが出るため、読み込みを遅滞させています

    @item_order = FactoryBot.build(:item_order, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '購入情報が登録できるとき' do
      it '全ての項目を適正に入力すれば登録できる' do
        expect(@item_order).to be_valid
      end
      it '建物名が未入力でも登録できる' do
        @item_order.building_name = nil
        expect(@item_order).to be_valid
      end
    end

    context '購入情報が登録できないとき' do
      it '郵便番号が空では登録できない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank",
                                                            'Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号が(数字３桁[-]数字4桁)の形式で「ハイフン」がないと登録できない' do
        @item_order.postal_code = 3_334_444
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が空では登録できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank",
                                                            "Prefecture can't be other_than: 1")
      end
      it '都道府県が未選択（prefecture_id = 1）では登録できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be other_than: 1")
      end
      it '市区町村が空では登録できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @item_order.telephone = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号にはハイフンを含むと登録できない' do
        @item_order.telephone = '090-1234-5678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone Not under 11 number')
      end
      it '電話番号が11桁より多いと登録できない' do
        @item_order.telephone = '090123456789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone Not under 11 number')
      end
      it '電話番号が英数混合では登録できない' do
        @item_order.telephone = '090aaaa56789'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Telephone Not under 11 number')
      end
      it 'tokenが空では登録できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
#  テストで使用
#  bundle exec rspec spec/models/item_order_spec.rb
#  @item_order.errors.full_messages
