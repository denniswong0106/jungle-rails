require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "given all fields are filled in, " do
      it "saves successfully" do
        @category = Category.new(:name => 'cars')
        @product = Product.create(:name => 'Ferrari', :price => '1', :quantity => '1', :category => @category)
        expect(@product.save).to be true
      end
    end

    context ":name not filled in, " do
      it "saves unsuccessfully" do
        @category = Category.new(:name => 'cars')
        @product = Product.create(:name => '', :price => '1', :quantity => '1', :category => @category)
        expect(@product.save).to be false
      end
    end

    context ":price not filled in, " do
      it "saves unsuccessfully" do
        @category = Category.new(:name => 'cars')
        @product = Product.create(:name => 'Ferrari', :price => '', :quantity => '1', :category => @category)
        expect(@product.save).to be false
      end
    end

    context ":quantity not filled in, " do
      it "saves unsuccessfully" do
        @category = Category.new(:name => 'cars')
        @product = Product.create(:name => 'Ferrari', :price => '1', :quantity => '', :category => @category)
        expect(@product.save).to be false
      end
    end

    context ":category not filled in, " do
      it "saves unsuccessfully" do
        @product = Product.create(:name => '', :price => '1', :quantity => '1')
        expect(@product.save).to be false
      end
    end

  end
end
