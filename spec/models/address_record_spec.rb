require 'rails_helper'

RSpec.describe AddressRecord, type: :model do
  describe '商品購入機能' do
    before do
      @address_record = FactoryBot.build(:address_record)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@address_record).to be_valid
    end
    it 'post_codeが空だと登録できないこと' do
      @address_record.post_code = nil
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeにハイフンがないと登録できないこと' do
      @address_record.post_code = 2_222_222
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include('Post code Input correctly')
    end

    it 'prefectureが空だと登録できないこと' do
      @address_record.prefecture = 0
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと登録できないこと' do
      @address_record.city = nil
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと登録できないこと' do
      @address_record.address = nil
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと登録できないこと' do
      @address_record.phone_number = nil
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが数字以外だと登録できないこと' do
      @address_record.phone_number = 'aaaaaaaaaaa'
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberが12桁以上だと登録できないこと' do
      @address_record.phone_number = 1_234_567_890_123
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include('Phone number Input only number')
    end

    it 'building_nameは空でも保存できること' do
      @address_record.building_name = nil
      expect(@address_record).to be_valid
    end

    it 'tokenが空では保存できないこと' do
      @address_record.token = nil
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では保存できないこと' do
      @address_record.user_id = nil
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存できないこと' do
      @address_record.item_id = nil
      @address_record.valid?
      expect(@address_record.errors.full_messages).to include("Item can't be blank")
    end
  end
end
