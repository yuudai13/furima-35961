require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが@が無いと登録できない' do
      @user.email = 'yuudaiybb.ne.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordに全角が含まれている場合は登録できない' do
      @user.password = 'あああ111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'ab0000'
      @user.password_confirmation = 'ab0000'
      expect(@user).to be_valid
    end
    it 'last_name_full_widthが空では登録できない' do
      @user.last_name_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name full width can't be blank")
    end
    it 'last_name_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.last_name_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name full width is invalid')
    end
    it 'first_name_full_widthが空では登録できない' do
      @user.first_name_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name full width can't be blank")
    end
    it 'first_name_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.first_name_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name full width is invalid')
    end
    it 'last_name_kana_full_widthが空では登録できない' do
      @user.last_name_kana_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana full width can't be blank")
    end
    it 'last_name_kana_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.last_name_kana_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana full width is invalid')
    end
    it 'first_name_kana_full_widthが空では登録できない' do
      @user.first_name_kana_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana full width can't be blank")
    end
    it 'first_name_kana_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.first_name_kana_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana full width is invalid')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
