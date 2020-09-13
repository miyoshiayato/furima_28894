FactoryBot.define do
  factory :item do
    association :user
    product_name                {"あいてむ"}
    product_description         {"いいあいてむだよ"}
    price                       {400}
    shipping_area_id            {"1"}
    category_id                 {"1"}
    product_status_id           {"1"}
    delivery_fee_id             {"1"}
    shipping_data_id            {"1"}
  end
end