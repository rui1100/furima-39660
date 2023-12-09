require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it '商品画像が空では登録できない' do
    end
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@user.errors.full_messages).to include("Description can't be blank")
    end
    # 商品の詳細
    it 'カテゴリーが「---」では登録できない' do
    end
    it '商品の状態が「---」では登録できない' do
    end
    # 配送について
    it '配送料の負担が「---」では登録できない' do
    end
    it '発送元の地域が「---」では登録できない' do
    end
    it '発送までの日数が「---」では登録できない' do
    end
    # 販売価格
    it '価格が空では登録できない' do
    end
    it '価格が¥300未満では登録できない' do
    end
end
