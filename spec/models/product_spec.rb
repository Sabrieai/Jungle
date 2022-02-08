require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "should save when all fields are filled" do
      @category = Category.create(name: 'Hair care')
      @product = Product.create(name:  'Miracle Shampoo', quantity: 10, price: 50,category: @category)

      expect(@product.id).to be_present
    end

    it "Should have a name" do 
      @category = Category.create(name: 'Hair care')
      @product = Product.create(name: nil, quantity: 10, price: 50,category: @category)

      expect(@product.id).to be_nil
      expect(@product.errors.messages[:name]).to eq ["can't be blank"]
    end

    it "should have a price" do 
      @category = Category.create(name: 'Hair care')
      # needed to add a work around because nil wasn't working the way it should have
      @product = Product.create(name: 'Miracle Shampoo', quantity: 10,price:"", category: @category)

      expect(@product.save).to be false
      expect(@product.errors.messages[:price]).to include "is not a number"
    end

   it "should have a quantity" do 
    @category = Category.create(name: 'Hair care')
    @product = Product.create(name: 'Miracle Shampoo', quantity: nil, price: 50,category: @category)

      expect(@product.id).to be_nil
      expect(@product.errors.messages[:quantity]).to eq ["can't be blank"]
    end

    it "should have a category" do
      @product = Product.create(name: 'Miracle Shampoo', quantity: 10, price: 50,category: nil)

      expect(@product.id).to be_nil
      expect(@product.errors.messages[:category]).to eq ["can't be blank"]
    end
  end
end
