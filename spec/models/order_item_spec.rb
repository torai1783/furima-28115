require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    @order = FactoryBot.build(:order_item)
  end

  describe '商品購入' do
    context '購入できるとき' do
    end
    it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号がある" do
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
      #expect(@order.errors.full_messages).to include("Users item must exist")
     end
    
     it "電話番号は11桁以内でないと登録できない" do
      @order.tel = "090123456789"
      @order.valid?   
      expect(@order.errors.full_messages).to include("Tel is invalid")
     end
  end   
end
