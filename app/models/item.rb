class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates  :name,              length: { maximum: 40 }
    validates  :description,       length: { maximum: 1000 }
    validates  :image
  
    with_options format: { with: /\A[0-9]+\z/ },
                 numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
      validates  :price
    end
  
    with_options numericality: { other_than: 0 } do
      validates  :category_id
      validates  :condition_id
      validates  :postage_id
      validates  :prefecture_id
      validates  :shipping_date_id
    end
  end
end



  
