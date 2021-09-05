class ShippingAddress < ApplicationRecord
  belongs_to :purchase_info
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
    validates :purchase_info_id
  end

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :prefectures_id
end
