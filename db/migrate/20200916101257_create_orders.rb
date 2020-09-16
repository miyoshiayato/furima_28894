class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal_code,     null: false
      t.integer    :prefecture,      null: false
      t.string     :city,            null: false
      t.string     :house_number,    null: false
      t.string     :phone_number,    null: false
      t.references :user,            foreign_key: true


      t.timestamps
    end
  end
end
