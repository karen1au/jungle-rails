require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
    scenario "user click on product to go to details page" do
      visit root_path
      product = page.find('article.product', match: :first)
      name = product.find('h4').text
      product.find('.pull-right').click
      expect(page).to have_css('.products-show')
      title = page.find('.products-show h1')
      expect(title.text).to end_with(name)
      save_screenshot 'details.png'
    end
end
