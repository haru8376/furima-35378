class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates  :name,              length: { maximum: 40 }
    validates  :description,       length: { maximum: 1000 }
    validates  :price,             format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 300, less_than: 9999999 }
    validates  :category_id,          
    validates  :condition_id,         
    validates  :postage_id,           
    validates  :prefecture_id,        
    validates  :shipping_date_id,     
    validates  :image,                
  end
end
