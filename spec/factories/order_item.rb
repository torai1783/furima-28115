FactoryBot.define do
  factory :order_item do
    
    postalcode                    {"123-4567"}
    city                          {"東京都"}
    address                       {"青山1-1"}
    tel                           {"09012345678"}
    deliverysource_id             {2}
    token                         {"tok_abcdefghijk00000000000000000"}
    building                      {"ハイツ201"}
    
    user 
    item   
  end
end

