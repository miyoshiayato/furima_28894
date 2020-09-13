require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'image、product_name、product_description、price、shipping_area_id、category_id、product_status_id、delivery_fee_id、shipping_data_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it '販売価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が全角では登録できない' do
        @item.price = 'あ００あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が¥300未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it '販売価格が¥10000000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it 'カテゴリーが未選択では登録できない' do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が未選択では登録できない' do
        @item.product_status_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end

      it '配送料の負担が未選択では登録できない' do
        @item.delivery_fee_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it '発送元の地域が未選択では登録できない' do
        @item.shipping_area_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送までの日数が未選択では登録できない' do
        @item.shipping_data_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping data can't be blank")
      end
    end
  end
end
