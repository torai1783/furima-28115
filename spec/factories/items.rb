FactoryBot.define do
  factory :item do
    
    name                          {"商品名"}
    description                   {"商品の説明です。"}
    category_id                   {2}
    status_id                     {2}
    charge_id                     {2}
    deliverysource_id             {2}
    deliveryday_id                {2}
    price                         {300}
    user

    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end   
  end
end
