require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'imageが空では登録できない' do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
  end
end
