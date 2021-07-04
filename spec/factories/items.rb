FactoryBot.define do
  factory :item do
    name               { 'タペストリー' }
    description        { '蚤の市で購入しました' }
    price              { 3000 }
    category_id        { 5 }
    condition_id       { 3 }
    postage_id         { 2 }
    prefecture_id      { 10 }
    shipping_date_id   { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
