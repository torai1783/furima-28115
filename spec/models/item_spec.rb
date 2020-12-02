require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id: user.id)
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
      it "画像、カテゴリー、商品の状態、配送料の有無、発送元の地域、発送までの日数が選択されていれば出品できる" do
      expect(@item).to be_valid 
      end
      it "商品名、商品の説明があれば出品できる" do
      @item.name = "商品名"
      @item.description ="商品の説明です。"
      expect(@item).to be_valid 
      end
      it "金額が入力されていれば出品できる"do
      @item.price = 300
      expect(@item).to be_valid
       end
    end

    
    context '商品が出品できないとき' do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと出品できない" do
       @item.description = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Description can't be blank")
      end 
      it "カテゴリーが選択されないと出品できない" do
        @item.category_id = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category must be other than 0") 
      end
      it "商品の状態が選択されないと出品できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it "配送料の有無を選択されないと出品できない" do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 0")  
      end
      it "発送元の地域出品を選択されないと出品できない" do
        @item.deliverysource_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverysource must be other than 0")
      end
      it "発送までの日数を選択されないと出品できない" do
        @item.deliveryday_id = 0
        @item.valid?  
        expect(@item.errors.full_messages).to include("Deliveryday must be other than 0")
      end
      it "価格を入力されないと出品できない" do
        @item.price = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not included in the list", "Price can't be blank", "Price is invalid")
      end
      it "価格半角数字で入力されないと出品できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格は300~9,999,999の間で設定しないと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格は300~9,999,999の間で設定しないと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end