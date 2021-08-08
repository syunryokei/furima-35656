class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :family_name 
          validates :first_name 
          validates :read_family 
          validates :read_first 
          validates :nickname 
          validates :birthday 
        end
         
end
