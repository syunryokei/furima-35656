require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'family_nameが空だと登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank") 
      end
      it 'family_nameが全角日本語でないと登録できないこと' do
        @user.family_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角で入力してください')
      end
      it 'first_nameが空だと登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it 'family_nameが全角日本語でないと登録できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力してください')
      end
      it 'read_familyが空だと登録できないこと' do
        @user.read_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read family can't be blank")
      end
      it 'read_familyが全角カタカナでないと登録できないこと' do
        @user.read_family = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read family 全角カナで入力してください')
      end
      it 'read_firstが空だと登録できないこと' do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first can't be blank")
      end
      it 'read_firstが全角カタカナでないと登録できないこと' do
        @user.read_first = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first 全角カナで入力してください')
      end
      it 'nicknameが空だと登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@を含まないと登録できないこと' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it 'passwordが5文字以下だと登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英字のみのpasswordでは登録できないこと' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it '数字のみのpasswordでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
      end
      it '全角文字を含むpasswordでは登録できないこと' do
        @user.password = 'ABC123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '生年月日が空だと登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

