require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
  end

  context "内容に問題ない場合" do
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to  be_valid
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to  be_valid
    end
  end
  
  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefectures_idが1未満では保存できないこと' do
      @purchase_address.prefectures_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures must be greater than or equal to 2")
    end
    it 'prefectures_idが48より大きいと保存できないこと' do
      @purchase_address.prefectures_id = 49
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures must be less than or equal to 48")
    end
    it 'prefectures_idが空だと保存できないこと' do
      @purchase_address.prefectures_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_address.address = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数字以外だと保存できないこと' do
      @purchase_address.phone_number = '０１００２０００３００'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
    end
    it 'userが紐付いていないと保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
