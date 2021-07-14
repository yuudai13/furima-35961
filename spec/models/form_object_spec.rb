require 'rails_helper'

RSpec.describe FormObject, type: :model do
 before do
      @item_shipping_addresses = FactoryBot.build(:form_object)
 end
 describe '商品購入機能' do
  context '購入が出来る場合' do
      it "priceとtokenがあれば保存ができること" do
        expect(@item_shipping_addresses).to be_valid
      end
      
      it "tokenが空では登録できないこと" do
        @item_shipping_addresses.token = nil
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include("Token can't be blank")
      end
    end
  


   context '購入出来ない場合' do
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
        @item_shipping_addresses.delivery_source_id = ""
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
      it '電話番号は10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @item_shipping_addresses.phone_number = "090-1234-5678"
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include "Phone number is not a number"
      end
    end
  end
end