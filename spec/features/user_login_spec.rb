require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    User.create!(first_name: "Dummy", last_name: "Test", email: "duMmy@gmail.com", password: "12345678", password_confirmation: "12345678")
  end
  scenario "User submit a login form" do
    visit new_session_path
    page.fill_in 'email', with: 'duMmy@gmail.com'
    page.fill_in 'password', with: '12345678'
    page.find('.btn-primary').click
    expect(page).to have_css 'a[href="/logout"]'
    save_screenshot 'login.png'
  end
end
