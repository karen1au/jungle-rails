class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy
  validates :email, uniqueness: { case_sensitive: false }
end
