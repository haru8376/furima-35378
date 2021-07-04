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
    validates  :price,             format: { with: /\A[0-9]+\z/ },
                                   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates  :category_id,       numericality: { other_than: 0 }
    validates  :condition_id,      numericality: { other_than: 0 }
    validates  :postage_id,        numericality: { other_than: 0 }
    validates  :prefecture_id,     numericality: { other_than: 0 }
    validates  :shipping_date_id,  numericality: { other_than: 0 }
    validates  :image
  end
end
