FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 4) }
    email                   { Faker::Internet.free_email }
    password                { '000OOO' }
    password_confirmation   { password }

    first_name              { '苗字' }
    last_name               { '名前' }
    first_kana              { 'ミョウジ' }
    last_kana               { 'ナマエ' }
    birthday                { '2000/2/22' }

    id                      { '9' }
  end
end

