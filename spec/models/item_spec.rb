require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'create' do
    context '商品が出品できる場合' do
      it 'name,description,price,category_id,condition_id,postage_id,prefecture_id,shipping_date_idがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'nameは41文字以上なら出品できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'descriptionは1001文字以上なら出品できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include 'Description is too long (maximum is 1000 characters)'
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが半角数字(全角)のみでないと出品できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'priceが半角英数字混合では出品できない' do
        @item.price = 'aa11'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'priceが¥300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it 'priceが¥10,000,000以上であれば出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it 'category_idが空では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end

      it 'condintion_idが空では出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 0'
      end

      it 'postage_idが空では出品できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Postage must be other than 0'
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
      end

      it 'shipping_date_idが空では出品できない' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping date must be other than 0'
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
