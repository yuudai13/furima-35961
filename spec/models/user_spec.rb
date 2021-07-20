require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全ての情報が正しい場合登録出来ること' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'ab0000'
      @user.password_confirmation = 'ab0000'
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it 'emailが@が無いと登録できない' do
      @user.email = 'yuudaiybb.ne.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは不正な値です")
    end
    it 'passwordが英字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
    end
    it 'passwordに全角が含まれている場合は登録できない' do
      @user.password = 'あああ111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
    end
    it 'last_name_full_widthが空では登録できない' do
      @user.last_name_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字（全角）を入力してください", "苗字（全角）は不正な値です")
    end
    it 'last_name_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.last_name_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（全角）は不正な値です')
    end
    it 'first_name_full_widthが空では登録できない' do
      @user.first_name_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（全角）を入力してください", "名前（全角）は不正な値です")
    end
    it 'first_name_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.first_name_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（全角）は不正な値です')
    end
    it 'last_name_kana_full_widthが空では登録できない' do
      @user.last_name_kana_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字（カタカナ）を入力してください", "苗字（カタカナ）は不正な値です")
    end
    it 'last_name_kana_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.last_name_kana_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（カタカナ）は不正な値です')
    end
    it 'first_name_kana_full_widthが空では登録できない' do
      @user.first_name_kana_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前 （カタカナ）を入力してください", "名前 （カタカナ）は不正な値です")
    end
    it 'first_name_kana_full_widthにバリデーションを満たさない場合は登録できない' do
      @user.first_name_kana_full_width = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前 （カタカナ）は不正な値です')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
