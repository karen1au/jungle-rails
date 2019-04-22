require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: "hot dog", description: "a hot dog with ketchup", price: 300, quantity: 3, category: Category.new(name: "Food"))
      @product2 = Product.create!(name: "tv", description: "40 inch LCD", price: 2000, quantity: 1, category: Category.new(name: "Electronics"))
      @product3 = Product.create!(name: "Earl Grey", description: "grew in the wild", price: 100, quantity: 4, category: Category.new(name: "Tea"))
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
            email: "dummy@gmail.com",
            stripe_charge_id: Rails.configuration.stripe[:publishable_key],
            total: 2300
      )
      # 2. build line items on @order
      @order.line_items.new(
            product: @product1,
            quantity: 2,
            item_price: @product1.price,
            total_price: @product1.price * 2
      )
      @order.line_items.new(
        product: @product2,
        quantity: 1,
        item_price: @product2.price,
        total_price: @product2.price * 1
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      @order.line_items.each do |entry|
        entry.product.decrement!(:quantity,entry.quantity)
      end
      # @product1.decrement!(:quantity,@order.line_items.find_by_product_id(@product1.id).quantity)
      # @product2.decrement!(:quantity,@order.line_items.find_by_product_id(@product2.id).quantity)
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      byebug
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eql(1)
      expect(@product2.quantity).to eql(0)
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end
  end
end