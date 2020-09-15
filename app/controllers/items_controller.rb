class ItemsController < ApplicationController
  before_action :not_sign_in, except: [:index, :show]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      flash[:notice] = '商品を出品しました'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end




  private

  def item_params
    params.require(:item).permit(:image, :product_name, :price, :product_description, :category_id, :product_status_id, :delivery_fee_id, :shipping_area_id, :shipping_data_id).merge(user_id: current_user.id)
  end

  def not_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
