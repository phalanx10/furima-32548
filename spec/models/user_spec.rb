require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@を含まないと登録できないこと' do
      @user.email = '1testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空だと登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字未満の場合は登録できないこと' do
      @user.password = 'test1'
      @user.password_confirmation = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数字でないと登録できないこと' do
      @user.password = 'test１２３'
      @user.password_confirmation = 'test１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'a12345'
      @user.password_confirmation = 'b12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空だと登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_nameが全角日本語でないと登録できないこと' do
      @user.family_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
    end

    it 'first_nameが全角日本語でないと登録できないこと' do
      @user.first_name = "rikutaro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end

    it 'family_name_kanaが空だと登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'family_name_kanaが全角カタカナでないと登録できないこと' do
      @user.family_name_kana = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
    end

    it 'first_name_kanaが全角カタカナでないと登録できないこと' do
      @user.first_name_kana = "rikutaro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
  end
end
