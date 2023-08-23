require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
  end

  describe '商品購入登録' do
  
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

      it "tokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end
    end

     context '内容に問題がある場合' do
      
      it 'zipcodeが空だと保存できないこと' do
        @order_address.zipcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode can't be blank", "Zipcode is invalid. Include hyphen(-)")
      end

       it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @order_address.zipcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zipcode is invalid. Include hyphen(-)')
      end

        it 'shipping_origin_idが2以上でなければ登録できない' do
          @order_address.shipping_origin_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Shipping origin は---以外で入力してください")
        end

        it 'cityが空だと保存できないこと' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it 'street_addressが空だと保存できないこと' do
          @order_address.street_address = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Street address can't be blank")
        end

        it 'phoneが空だと保存できないこと' do
          @order_address.phone = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone can't be blank")
        end

        it 'phoneが10桁以上11桁以内の半角数値のみでないと保存できないこと' do
          @order_address.phone = '090-1234-5678'
          @order_address.valid?
          
          expect(@order_address.errors.full_messages).to include("Phone は10桁以上11桁以内の半角数値のみで入力してください")
        end
        
        
        it 'phoneが9桁以下だと保存できないこと' do
          @order_address.phone = '09011111'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone は10桁以上11桁以内の半角数値のみで入力してください")
        end

        it 'phoneが12桁以上だと保存できないこと' do
          @order_address.phone = '090111111111'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone は10桁以上11桁以内の半角数値のみで入力してください")
        end

        it 'itemが紐付いていないと保存できないこと' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end

        it 'userが紐付いていないと保存できないこと' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end

        it "tokenが空では登録できないこと" do
          @order_address.token = nil
          @order_address.valid?
          
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        
    end
   
  end
end