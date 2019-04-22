class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy
  validates :password, length: { minimum: 7 }
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(e, p)
    @user = User.find_by(email:e.strip)
    if @user && @user.authenticate(p)
      @user
    else
      nil
    end
  end

end
