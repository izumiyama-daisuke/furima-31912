FactoryBot.define do
  factory :item_order do
    postal_code                { '333-4444' }
    prefecture_id              { rand(2..48) }
    city                       { '横浜市緑区' }
    address1                   { '青山1-1-1' }
    address2                   { '柳ビル103' }
    telephone                  { '09012345678' }
    item_id                    { rand(30) }
    user_id                    { rand(30) }
    token                      { 'tok_abcdefghijk00000000000000000' }
  end
end
