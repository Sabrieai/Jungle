require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "should save when all fields are filled" do
      @category = Category.create(name: 'Hair care')
      puts @category
      @product = Product.create(name:  'Miracle Shampoo', quantity: 10, price: 50,category: @category)

      expect(@product.id).to be_present
    end

    it "Should have a name" do 
      @category = Category.create(name: 'Hair care')
      puts @category
      @product = Product.create(name: nil, quantity: 10, price: 50,category: @category)

      expect(@product.id).to be_nil
      expect(@product.errors.messages[:name]).to eq ["can't be blank"]
    end

    xit "should have a price" do 
    end

   xit "should have a quantity" do 
    end

    xit "should have a category" do
    end
  end
end
