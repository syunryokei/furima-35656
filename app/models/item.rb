class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :postage_type
    belongs_to :prefectures
    belongs_to :delivery_days
    
    with_options presence: true do
      validates :image
      validates :product_name
      validates :product_info
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefectures_id
    validates :delivery_days_id
  end
end
