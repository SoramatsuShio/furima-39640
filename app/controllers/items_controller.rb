class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:edit, :show, :update, :destroy] 
  before_action :contributor_confirmation, only:[:edit, :destory]

  
  def index
    #@items = Item.order("id DESC")# Item商品出品情報全部のレコードをトップページを表示するindexアクションのコード
    @items = Item.all.order("created_at DESC")
  end
  

  def new
    @item = Item.new # Item出品画面へ遷移するnewアクションのコード
  end



  def edit
    @item = Item.find(params[:id])
  if @item.sold_out? || current_user.id != @item.user_id
    redirect_to root_path
   end
  end


  def show
  end

  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
  end
end
  
  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
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
      ).merge(user_id: current_user.id)
  end

   


  def contributor_confirmation
     redirect_to root_path unless  current_user == @item.user
  end

   

  def set_item
    @item = Item.find(params[:id])
  end

end


