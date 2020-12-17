require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    user = FactoryBot.create(:user)
    sleep 1
    item = FactoryBot.create(:item) 
    # binding.pry

    @order = FactoryBot.build(:order_item, user_id: user.id, item_id: item.id)#購入履歴のID
  end

  describe '商品購入' do
   context '購入できるとき' do
      it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号・tokenがある" do
        expect(@order).to be_valid
      end

      it "建物名がなくても登録できる" do
        @order.building = ""
        expect(@order).to be_valid
      end
    end

   context '購入ができないとき' do
      it "郵便番号が空だと登録できない" do
       @order.postalcode = ""
       @order.valid?
       expect(@order.errors.full_messages).to include("Postalcode can't be blank", "Postalcode is invalid")
      end

      it "市区町村が空だと登録できない" do
       @order.city = ""
       @order.valid?
       expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空だと登録できない" do
       @order.address = ""
       @order.valid?
       expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空だと登録できない" do
       @order.tel = ""
       @order.valid?
       expect(@order.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
      end

      it "都道府県が空だと登録できない" do
       @order.deliverysource_id = 0
       @order.valid?  
       expect(@order.errors.full_messages).to include("Deliverysource must be other than 0")
      end

      it "郵便番号にはハイフンが無いと登録できない" do
       @order.postalcode = "1234567"
       @order.valid?
       expect(@order.errors.full_messages).to include("Postalcode is invalid")
      end
    
      it "電話番号は11桁以内でないと登録できない" do
       @order.tel = "090123456789"
       @order.valid?   
       expect(@order.errors.full_messages).to include("Tel is invalid")
      end

      it "英数混合だと登録できない" do
       @order.tel = "090123456ab"
       @order.valid? 
       expect(@order.errors.full_messages).to include("Tel is invalid")
      end

      it "tokenが空では登録できない" do
       @order.token = nil
       @order.valid?
       expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できない" do
       @order.user_id = nil
       @order.valid?
       expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できない" do
       @order.item_id = nil
       @order.valid?
       expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end   
end
