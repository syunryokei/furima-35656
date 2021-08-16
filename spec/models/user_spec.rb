require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'family_nameが空だと保存できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank") 
      end
      it 'family_nameが全角日本語でないと保存できないこと' do
        @user.family_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角で入力してください')
      end
      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it 'family_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力してください')
      end
      it 'read_familyが空だと保存できないこと' do
        @user.read_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read family can't be blank")
      end
      it 'read_familyが全角カタカナでないと保存できないこと' do
        @user.read_family = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read family 全角カナで入力してください')
      end
      it 'read_firstが空だと保存できないこと' do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first can't be blank")
      end
      it 'read_firstが全角カタカナでないと保存できないこと' do
        @user.read_first = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first 全角カナで入力してください')
      end
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
    end
  end
end
