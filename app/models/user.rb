class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
         READ_NAME_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/.freeze
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

        with_options presence: true do
          validates :family_name, format: {with: NAME_REGEX, message: '全角で入力してください' }
          validates :first_name, format: {with: NAME_REGEX, message: '全角で入力してください' }
          validates :read_family, format: {with: READ_NAME_REGEX, message: '全角カナで入力してください' }
          validates :read_first, format: {with: READ_NAME_REGEX, message: '全角カナで入力してください' }
          validates :nickname 
          validates :birthday 
        end
        validates :password,  format: {with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください' }


        has_many :items

end
