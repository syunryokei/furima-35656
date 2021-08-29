require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を出品できる場合' do
      it '全ての情報が正しく存在していれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'product_nameがないと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_infoがないと出品できない' do
        @item.product_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product info can't be blank")
      end
      it 'category_idがないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end
      it 'condition_idがないと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を選択してください')
      end
      it 'postage_type_idがないと出品できない' do
        @item.postage_type_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage type を選択してください')
      end
      it 'prefectures_idがないと出品できない' do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures を選択してください')
      end
      it 'delivery_days_idがないと出品できない' do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days を選択してください')
      end
      it 'priceがないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を選択してください')
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.postage_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage type を選択してください')
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures を選択してください')
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days を選択してください')
      end
      it '価格が全角数字では出品できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '半角英数混合では出品できない' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '半角英語だけでは出品できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が300円未満では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
