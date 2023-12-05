require 'rails_helper'

RSpec.describe User, type: :model do
  before do
   @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したメールアドレスが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      @user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは@を含まないと登録できない' do
      @user.email = 'testcom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは6文字以上でないと登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードは半角英数字混合での入力でないと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'パスワードとパスワード(確認)の値が一致しないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end
end
