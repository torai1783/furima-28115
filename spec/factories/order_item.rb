FactoryBot.define do
  factory :order_item do
    
    postalcode                    {"123-456"}
    city                          {"東京都"}
    address                       {"青山1-1"}
    tel                           {"09012345678"}
    deliverysource_id             {2}
 
  end
end

