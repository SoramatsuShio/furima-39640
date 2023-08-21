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
    end

     context '内容に問題がある場合' do
      
      it 'zipcodeが空だと保存できないこと' do
        @order_address.zipcode = ''
        @order_address.valid?
        binding.pry
        expect(@order_address.errors.full_messages).to include('Zipcode can't be blank, Zipcode is invalid. Include hyphen(-)')
      end

           

     


    end
   
  end
end