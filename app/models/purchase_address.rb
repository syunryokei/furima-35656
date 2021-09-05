class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building_name, :phone_number, :prefectures_id, :purchase_info_id, :user_id, :item_id


  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze

  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, length: {maximum: 11} }
    validates :prefectures_id, numericality: { other_than: 1, only_integer: true }
    validates :user_id
  end


  def save
    @purchase_info = PurchaseInfo.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, city: city, address: address, building_name: building_name, phone_number: phone_number, prefectures_id: prefectures_id, purchase_info_id: @purchase_info.id)
  end
  
end