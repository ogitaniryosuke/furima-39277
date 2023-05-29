class OrdersController < ApplicationController
  before_action :item_set, only: [:index, :create]
  before_action :order_address_set, only: [:index, :new]
  
  def index
  
  end

  def new
  
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
      else
        render :index
      end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def order_address_set
    @order_address = OrderAddress.new
  end
end



