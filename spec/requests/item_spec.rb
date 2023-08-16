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
  end
end



