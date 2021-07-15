require 'rails_helper'

RSpec.describe FormObject, type: :model do
  describe '商品購入機能' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_shipping_addresses = FactoryBot.build(:form_object, user_id: user.id, item_id: item.id)
    sleep 0.5
  end
 
  context '購入が出来る場合' do
      it 'priceとtokenがあれば保存ができること' do
        expect(@item_shipping_addresses).to be_valid
      end
        it '建物名が無くても保存ができること' do
          @item_shipping_addresses.building_name = ""
          expect(@item_shipping_addresses).to be_valid
        end
    end
  


    context '購入出来ない場合' do
      it "tokenが空では登録できないこと" do
        @item_shipping_addresses.token = nil
        @item_shipping_addresses.valid?
      expect(@item_shipping_addresses.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @item_shipping_addresses.postal_code = ""
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Postal code can't be blank", "Postal code is invalid"
      end
      it '郵便番号がハイフンが無くてはできない' do
        @item_shipping_addresses.postal_code = 4445555
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Postal code is invalid"
      end
      it '都道府県が空では登録できない' do
        @item_shipping_addresses.delivery_source_id = 0
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Delivery source can't be blank", "Delivery source can't be blank"
      end
      it '市町村が空では登録できない' do
        @item_shipping_addresses.municipalities = ""
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Municipalities can't be blank"
      end
      it '番地が空では登録できない' do
        @item_shipping_addresses.address = ""
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空では登録できない' do
        @item_shipping_addresses.phone_number = ""
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Phone number can't be blank", "Phone number is not a number"
      end
      it '電話番号は10桁以上11桁以内の半角数値のみ保存可能' do
        @item_shipping_addresses.phone_number = "090-1234-5678"
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Phone number is not a number"
      end
      it '電話番号は12桁以上では登録出来ない' do
        @item_shipping_addresses.phone_number = "090123456780"
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it '電話番号は9桁以下では登録出来ない' do
        @item_shipping_addresses.phone_number = "123456789"
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
      end
      it '電話番号は英数混合では登録出来ない' do
        @item_shipping_addresses.phone_number = "0801608060a"
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Phone number is not a number"
      end
    end
  end
end