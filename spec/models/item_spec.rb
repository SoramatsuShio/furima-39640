require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品新規登録できるとき（正常系）' do
  it '下記が存在すれば登録できる。
      商品画像、
      商品名、
      商品の説明、
      商品の詳細、
      カテゴリ、
      商品の状態、
      配送について、
      配送料、発送元、
      発送日数、
      販売価格' do
    expect(@item).to be_valid
      end
    end


      context '商品新規登録できないとき(異常系)' do
      it 'item_nameが空では登録できない' do
      @item.item_name = ''  # item_nameの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_descが空では登録できない' do
      @item.item_desc = ''  # item_descの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include "Item desc can't be blank"
      end

      it 'category_idが空では登録できない' do
      @item.category_id = '1'  # category_idの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it 'item_status_idが空では登録できない' do
      @item.item_status_id = '1'  # item_status_idの値を空にする
      @item.valid?
      expect(@item.errors.full_messages).to include "Item status must be other than 1"
      end

     
      it 'delivery_charge_idが空では登録できない' do 
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery charge must be other than 1"
      end

      it 'shipping_origin_idが空では登録できない' do
      @item.shipping_origin_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping origin must be other than 1"
      end

      it 'days_until_dispatch_idが空では登録できない' do
      @item.days_until_dispatch_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Days until dispatch must be other than 1"
      end

      it 'mini_sell_priceが空では登録できない' do
      @item.mini_sell_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Mini sell price can't be blank"
      end

      it 'mini_sell_priceが299円以下は登録できない' do
        @item.mini_sell_price = '299'  # 300円未満の販売価格を設定
        @item.valid?  # バリデーションチェックを実行
        expect(@item.errors.full_messages).to include("Mini sell price must be greater than or equal to 300")
        end

      it 'mini_sell_priceが9999999円以上は登録できない' do
        @item.mini_sell_price = '10000000'  # 10000000円以上の販売価格を設定
        @item.valid?  # バリデーションチェックを実行
        expect(@item.errors.full_messages).to include("Mini sell price must be less than or equal to 9999999")
        end


      it '全角文字を含む販売価格では登録できない' do
        @item.mini_sell_price = '２０００' # 全角の販売価格を設定
        @item.valid?
        expect(@item.errors.full_messages).to include "Mini sell price is not a number"
        end
  
      end
    end
  end



