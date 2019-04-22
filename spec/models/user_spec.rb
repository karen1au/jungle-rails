require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(first_name: "Dummy", last_name: "Test", email: "duMmy@gmail.com", password: "12345678", password_confirmation: "12345678")
  }
  describe 'Validations' do
    it 'is not valid when password confirmation do not match' do
      subject.password_confirmation = "22222"
      expect(subject).to_not be_valid
    end

    it 'is not valid when email already exists' do
      test1 = User.new(first_name: "Tom", last_name: "Test", email: "duMmy@gmail.com", password: "12345678", password_confirmation: "12345678")
      test1.save
      subject.email = "duMmy@gmail.com"
      expect(subject).to_not be_valid
      # puts subject.errors.full_messages
    end

    it 'is not valid when password is shorter than 7' do
      subject.password = "123"
      subject.password_confirmation = "123"
      expect(subject).to_not be_valid
      # puts subject.errors.full_messages
    end
  end

  describe '.authenticate_with_credentials' do
    it 'cannot login with email that does not exist' do
      @user = User.authenticate_with_credentials("test@test.com", "12345678")
      # session[:user_id] = @user.id
      expect(@user).to be nil
    end

    it 'can login when user input extra space in front or end' do
      test1 = subject
      test1.save
      @user = User.authenticate_with_credentials(" duMmy@gmail.com   ", "12345678")
      expect(@user).to be_an_instance_of(User) 
    end

    it 'can login when user input with different casing' do
      test1 = subject
      test1.save
      @user = User.authenticate_with_credentials("Dummy@Gmail.com", "12345678")
      expect(@user).to be_an_instance_of(User) 
    end
    
  end

end
