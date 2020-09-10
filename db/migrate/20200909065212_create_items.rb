class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string  :product_name
      t.integer :price
      t.integer :product_description
      t.integer :Category_id
      t.integer :ProductStatus_id
      t.integer :DeliveryFee_id
      t.integer :ShippingArea_id
      t.integer :ShippingData_id
      t.references :user, foreign_key: true

    end
  end
end
