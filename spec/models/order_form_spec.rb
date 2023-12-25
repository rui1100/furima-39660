require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '購入機能' do
    context '購入できる場合' do
      it '正しい情報で購入できること' do
        expect(@order_form).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号が必須であること' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県が必須であること' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が必須であること' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が必須であること' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は10桁以上であること' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は12桁未満であること' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は半角数値のみであること' do
        @order_form.phone_number = '090abcdefgh'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'ユーザー情報が紐づいていること' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it '商品情報が紐づいていること' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
