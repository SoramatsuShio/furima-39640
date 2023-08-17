class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.all # Item出品画面をトップページを表示するindexアクションのコード
  end
  

  def new
    @item = Item.new # Item出品画面へ遷移するnewアクションのコード
  end


  def create
    # createアクションのコード
    @item = Item.new(item_params) # 出品情報を登録するアクション

    if @item.save
      redirect_to '/'
    else
      render :new
    end
  end

  private
  
  # ストロングパラメータを定義
  def item_params
    params.require(:item).permit(
      :image,
      :item_name,
      :item_desc,
      :category_id,
      :item_status_id,
      :delivery_charge_id,
      :shipping_origin_id,
      :days_until_dispatch_id,
      :mini_sell_price,
      :user_id 
      )
  end



end
