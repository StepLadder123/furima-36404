require 'rails_helper'

RSpec.describe PurchaseShipAddress, type: :model do
  before do
    @purchase_ship_address = FactoryBot.build(:purchase_ship_address)
  end
  describe '商品購入' do
    context '商品購入できるとき'do
      it 'postal_code, prefecture_id, city, address, build_name, phone_numberが存在すれば登録できること' do
        expect(@purchase_ship_address).to be_valid
      end
      
      it '建物名は空でも登録できること' do
        @purchase_ship_address.build_name = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address).to be_valid
      end

      it '電話番号は11文字でも登録できること' do
        @purchase_ship_address.phone_number = '09012345678'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address).to be_valid
      end
    end
    
    context '商品購入できないとき' do
      it '郵便番号が必須であること' do
        @purchase_ship_address.postal_code = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it '郵便番号が7文字以下では登録できないこと' do
        @purchase_ship_address.postal_code = '123-567'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Input 8 half-width characters (include hyphen(-)).")
      end
      
      it '郵便番号が9文字以上では登録できないこと' do
        @purchase_ship_address.postal_code = '123-456789'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Input 8 half-width characters (include hyphen(-)).")
      end
      
      it '郵便番号が全角では登録できないこと' do
        @purchase_ship_address.postal_code = '１２３－４５６７'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Input 8 half-width characters (include hyphen(-)).")
      end
      
      it '郵便番号の4文字目が「-」であること' do
        @purchase_ship_address.postal_code = '12345678'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Input 8 half-width characters (include hyphen(-)).")
      end
      
      it '郵便番号の先頭3文字が半角数字であること' do
        @purchase_ship_address.postal_code = '12-34567'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Input 8 half-width characters (include hyphen(-)).")
      end
      
      it '郵便番号の末尾4文字が半角数字であること' do
        @purchase_ship_address.postal_code = '1234-567'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code is invalid. Input 8 half-width characters (include hyphen(-)).")
      end
      
      it '配送先都道府県の情報のidが初期値でないこと' do
        @purchase_ship_address.prefecture_id = 1
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it '配送先市区町村の情報が必須であること' do
        @purchase_ship_address.city = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("City can't be blank")
      end
      
      it '配送先番地の情報が必須であること' do
        @purchase_ship_address.address = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Address can't be blank")
      end
      
      it '電話番号の情報が必須であること' do
        @purchase_ship_address.phone_number = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it '電話番号が9文字以下では登録できないこと' do
        @purchase_ship_address.phone_number = '012345678'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Input 10 or 11 half-width characters (not include hyphen(-)).")
      end
      
      it '電話番号が12文字以上では登録できないこと' do
        @purchase_ship_address.phone_number = '012345678901'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Input 10 or 11 half-width characters (not include hyphen(-)).")
      end
      
      it '電話番号が全角では登録できないこと' do
        @purchase_ship_address.phone_number = '０１２３４５６７８９'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Input 10 or 11 half-width characters (not include hyphen(-)).")
      end

      it '電話番号に数字以外の文字があると登録できないこと' do
        @purchase_ship_address.phone_number = '012-3456789'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Phone number is invalid. Input 10 or 11 half-width characters (not include hyphen(-)).")
      end  

      it 'トークンが空では登録できないこと' do
        @purchase_ship_address.token = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Token can't be blank")
      end  
    end
  end
end
