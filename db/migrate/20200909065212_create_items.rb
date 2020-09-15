class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :product_name
      t.integer    :price
      t.text       :product_description
      t.integer    :category_id
      t.integer    :product_status_id
      t.integer    :delivery_fee_id
      t.integer    :shipping_area_id
      t.integer    :shipping_data_id
      t.references :user, foreign_key: true

    end
  end
end
