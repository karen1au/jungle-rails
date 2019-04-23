require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "user add product to cart" do
    visit root_path
    page.find('article.product .fa-shopping-cart', match: :first).click
    cart = page.find('a[href="/cart"]')
    expect(cart).to have_text 'My Cart (1)'
    save_screenshot 'cart.png'
  end
end
