class ShippingAddress < ApplicationRecord
  belongs_to :purchase_info
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures

end