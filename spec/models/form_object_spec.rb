require 'rails_helper'

RSpec.describe FormObject, type: :model do
    before do
      @item_shipping_addresses = FactoryBot.build(:form_object)
    end
  
    context '内容に問題ない場合' do
      it "priceとtokenがあれば保存ができること" do
        expect(@item_shipping_addresses).to be_valid
      end
      
      context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @item_shipping_addresses.token = nil
        @item_shipping_addresses.valid?
        expect(@item_shipping_addresses.errors.full_messages).to include("Token can't be blank")
      end
  
  
    #   describe '商品出品機能' do
  #  context '商品出品が出来る時' do
  #     it '全ての情報が正しい場合登録出来ること' do
  #       expect(@item).to be_valid
  #     end
  #  end
  #  context '商品が出品出来ない時' do
  #     it '郵便番号が空では登録できない' do
  #       @item_shipping_addresses.postal_code = ""
  #       @item_shipping_addresses.valid?
  #       expect(@item_shipping_addresses.errors.full_messages).to include "postal_code can't be blank"
  #     end
  #     it '都道府県が空では登録できない' do
  #       @item_shipping_addresses.delivery_source_id = ""
  #       @item_shipping_addresses.valid?
  #       expect(@item_shipping_addresses.errors.full_messages).to include "delivery_source_id can't be blank"
  #     end
  #     it '市町村が空では登録できない' do
  #       @item_shipping_addresses.municipalities = ""
  #       @item_shipping_addresses.valid?
  #       expect(@item_shipping_addresses.errors.full_messages).to include "municipalities can't be blank"
  #     end
  #     it '番地が空では登録できない' do
  #       @item_shipping_addresses.address = ""
  #       @item_shipping_addresses.valid?
  #       expect(@item_shipping_addresses.errors.full_messages).to include "address can't be blank"
  #     end
  #     it '電話番号が空では登録できない' do
  #       @item_shipping_addresses.phone_number = ""
  #       @item_shipping_addresses.valid?
  #       expect(@item_shipping_addresses.errors.full_messages).to include "phone_number can't be blank"
  #     end
end
end
end