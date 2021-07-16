class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :city, :house_number, :building_name, :phone_number, :prefecture_id,).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
