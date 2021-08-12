require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できるとき'do
      it 'name, info, category_id, status_id, ship_fee_id, ship_area_id, ship_schedule_id, price, imageが存在すれば登録できること' do
        expect(@item).to be_valid
      end      
    end
    
    context '商品出品できないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it '商品の説明が必須であること' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      
      it 'カテゴリーの情報のidが初期値でないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      
      it '商品の状態の情報のidが初期値でないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      
      it '配送料の負担の情報のidが初期値でないこと' do
        @item.ship_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship fee can't be blank")
      end
      
      it '発送元の地域の情報のidが初期値でないこと' do
        @item.ship_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end
      
      it '発送までの日数の情報のidが初期値でないこと' do
        @item.ship_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship schedule can't be blank")
      end
      
      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it '価格が300円未満では出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      
      it '価格が10,000,000円以上では出品できないこと' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      
      it '価格は半角数値のみ保存可能であること' do
        @item.price = '１０'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      
      it '半角英数字混合では登録できないこと' do
        @item.price = 'a1b2c3'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'ユーザーが紐付いていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
