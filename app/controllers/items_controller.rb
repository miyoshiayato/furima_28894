class ItemsController < ApplicationController
  before_action :not_sign_in, except:[:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      flash[:notice] = "商品を出品しました"
    else
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :product_name, :price, :product_description, :category_id, :product_status_id, :delivery_fee_id, :shipping_area_id, :shipping_data_id).merge(user_id: current_user.id)
  end
  
  def not_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
