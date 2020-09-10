class ItemsController < ApplicationController
  before_action :not_sign_in, except:[:index]

  def new
  end

  def create
  end

  def index
  end

  def not_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :product_description, :Category_id, :ProductStatus_id, :DeliveryFee_id, :ShippingArea_id, :ShippingData_id).merge(user_id: current_user.id)
  end
end
