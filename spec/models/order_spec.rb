require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
  end

  describe '購入機能' do
    context '購入できる場合' do
      it '正しい情報で購入できること' do
      end
    end

    context '購入できない場合' do
      it '郵便番号が必須であること' do
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      end

      it '都道府県が必須であること' do
      end

      it '市区町村が必須であること' do
      end

      it '番地が必須であること' do
      end

      it '電話番号が必須であること' do
      end

      it '電話番号は9桁以上であること' do
      end

      it '電話番号は12桁未満であること' do
      end

      it '電話番号は半角数値のみであること' do
      end

      it 'ユーザー情報が紐づいていること' do
      end

      it '商品情報が紐づいていること' do
      end
      








end
