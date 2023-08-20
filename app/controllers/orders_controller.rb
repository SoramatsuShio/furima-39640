class OrdersController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:index, :show ] 



  def index
    @order_form = OrderForm.new
  end
  
  def show
  end


  def new
   @order_address = OrderForm.new(item_id: params[:item_id])
  end



  def create
    @order_address = OrderForm.new(order_params)
    
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

 

  private

 # ストロングパラメータを定義
  def order_params
    params.require(:order_form).permit(:mini_sell_price, :zipcode, :prefecture_id, :city, :street_address, :building_name, :phone).merge(user_id: current_user.id)
  end

  
  def set_item
    @item = Item.find(params[:item_id])
  end
  

end
