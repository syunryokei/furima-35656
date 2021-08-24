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
    validates :product_name
    validates :product_info
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :category_id, numericality: { other_than: 1, message: "カテゴリーを選択してください" }
    validates :condition_id, numericality: { other_than: 1, message: "商品の状態を選択してください" }
    validates :postage_type_id, numericality: { other_than: 1, message: "発送料の負担を選択してください" }
    validates :prefectures_id, numericality: { other_than: 1, message: "発送元の地域を選択してください" }
    validates :delivery_days_id, numericality: { other_than: 1, message: "発送までの日数を選択してください" }
  end
end
