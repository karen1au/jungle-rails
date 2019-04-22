require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      User.new(first_name: "Dummy", last_name: "Test", email: "dummy@gmail.com", password: "12345678", password_confirmation: "12345678")
    }

    it 'is not valid when password confirmation do not match' do
      subject.password_confirmation = "22222"
      expect(subject).to_not be_valid
    end

    it 'is not valid when email already exists' do
      test1 = User.new(first_name: "Tom", last_name: "Test", email: "dummy@gmail.com", password: "12345678", password_confirmation: "12345678")
      test1.save
      subject.email = "duMmy@gmail.com"
      expect(subject).to_not be_valid
      puts subject.errors.full_messages
    end


  end
end
