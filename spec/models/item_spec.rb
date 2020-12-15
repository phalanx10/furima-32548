require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it 'item_nameが空だと登録できないこと' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'descriptionが空だと登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空だと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが、¥300未満では保存できないこと' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが、¥9999999以上では保存できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceは半角数字でないと保存できないこと' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'status_idが空だと登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'delivery_days_idが空だと登録できないこと' do
      @item.delivery_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days can't be blank")
    end

    it 'shipping_area_idが空だと登録できないこと' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it 'delivery_fee_idが空だと登録できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it 'categories_idが空だと登録できないこと' do
      @item.categories_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Categories can't be blank")
    end

    it 'imageが空だと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
