require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category is not a number'
    end
    it 'category_idが1では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category must be other than 1'
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Condition is not a number'
    end
    it 'condition_idが1では登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Condition must be other than 1'
    end
    it 'delivery_charge_idが空では登録できない' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delivery charge is not a number'
    end
    it 'delivery_charge_idが1では登録できない' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delivery charge must be other than 1'
    end
    it 'delivery_source_idが空では登録できない' do
      @item.delivery_source_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delivery source is not a number'
    end
    it 'delivery_source_idが0では登録できない' do
    @item.delivery_source_id = '0'
    @item.valid?
    expect(@item.errors.full_messages).to include 'Delivery source must be other than 0'
    end
    it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Shipping day is not a number'
    end
    it 'shipping_day_idが1では登録できない' do
      @item.shipping_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Shipping day must be other than 1'
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceが300より下の数値は登録できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it 'priceが9999999より上の数値は登録できない' do
      @item.price = '100000000'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 99999999"
    end
    it 'priceが半角数値のみ保存可能である' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
  end
end
