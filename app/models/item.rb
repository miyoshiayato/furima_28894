class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_data

  with_options presence: true do
    validates :image
    validates :product_name, length: { maximum: 40 }
    validates :price, length: { minimum: 3, maximum: 7 }, numericality: { only_integer: true, greater_than: 300, less_than: 10_000_000 }
    validates :product_description, length: { maximum: 40 }
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" } 
    validates :product_status_id, numericality: { other_than: 0,message: "can't be blank" } 
    validates :delivery_fee_id, numericality: { other_than: 0, message: "can't be blank" } 
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" } 
    validates :shipping_data_id, numericality: { other_than: 0, message: "can't be blank" } 
  end
end
