require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
    @category = Category.new(name: 'test')
  end
    it 'is valid' do
      @product = Product.new(name: 'test', price: 5, quantity: 5, category: @category)
      expect(@product).to be_valid
    end
    it 'is not valid without a name' do
      @product = Product.new(name: nil, price: 50, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a price' do
      @product = Product.new(name: 'test', price: nil, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a quantity' do
      @product = Product.new(name: 'test', price: 5, quantity: nil, category: @category)
      expect(@product).to_not be_valid

    end
    it 'is not valid without a category' do
      @product = Product.new(name: 'test', price: nil, quantity: 2, category: nil)
      expect(@product).to_not be_valid
    end
  end
end