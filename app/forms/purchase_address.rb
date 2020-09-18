class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :token

    with_options numericality: { other_than: 0 } do
      validates :prefecture_id
    end
  end

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end