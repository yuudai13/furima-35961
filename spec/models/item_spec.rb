require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
 context '商品出品が出来る時' do
    it '全ての情報が正しい場合登録出来ること' do
      expect(@item).to be_valid
    end
 end
 context '商品が出品出来ない時' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "商品の画像を入力してください"
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "商品名を入力してください"
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "商品の説明を入力してください"
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "カテゴリーを入力してください", "カテゴリーは数値で入力してください"
    end
    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include 'カテゴリーは1以外の値にしてください'
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include '商品の状態を入力してください', '商品の状態は数値で入力してください'
    end
    it 'condition_idが1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include '商品の状態は1以外の値にしてください'
    end
    it 'delivery_charge_idが空では登録できない' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "配送料の負担を入力してください", "配送料の負担は数値で入力してください"
    end
    it 'delivery_charge_idが1では登録できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "配送料の負担は1以外の値にしてください"
    end
    it 'delivery_source_idが空では登録できない' do
      @item.delivery_source_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "発送元の地域を入力してください", "発送元の地域は数値で入力してください"
    end
    it 'delivery_source_idが0では登録できない' do
    @item.delivery_source_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include "発送元の地域は0以外の値にしてください"
    end
    it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "発送までの日数を入力してください", "発送までの日数は数値で入力してください"
    end
    it 'shipping_day_idが1では登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "発送までの日数は1以外の値にしてください"
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "販売価格を入力してください", "販売価格は数値で入力してください"
    end
    it 'priceが300より下の数値は登録できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include "販売価格は300以上の値にしてください"
    end
    it 'priceが9999999より上の数値は登録できない' do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include "販売価格は9999999以下の値にしてください"
    end
    it 'priceが半角数値のみ保存可能である' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
    end
    it 'priceは半角英数混合では登録できない' do
      @item.price = 'aaaa4444'
      @item.valid?
      expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
    end
    it 'price半角英語だけでは登録できない' do
      @item.price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
    end
    it 'userが空では登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Userを入力してください"
    end
  end
 end
end