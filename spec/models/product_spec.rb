require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
    Product.new(name: "hotdog", price: 1234, quantity: 3, category: Category.new(name:"Furniture"))
  }
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    
    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid

      # puts subject.errors.full_messages
    end

  end
end
