class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :category_id,        null: false
      t.string     :product_name,       null: false
      t.text       :product_info,       null: false
      t.integer    :price,              null: false
      t.integer    :condition_id,       null: false
      t.integer    :postage_type_id,    null: false
      t.integer    :prefectures_id,     null: false
      t.integer    :delivery_days_id,   null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
