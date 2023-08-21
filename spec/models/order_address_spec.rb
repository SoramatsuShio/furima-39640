require 'rails_helper'

  RSpec.describe OrderAddress, type: :model do
    describe 'オーダー情報の保存' do
      before do
        user = FactoryBot.create(:user)
        @order_address = FactoryBot.build(:order_address, user_id: user.id)
      end
  
      context '内容に問題ない場合' do
        it '下記が存在すれば登録できる。
          郵便番号、
          都道府県、
          市区町村、
          番地、
          建物名、
          電話番号' do
        expect(@address_order).to be_valid
          end
        
end
