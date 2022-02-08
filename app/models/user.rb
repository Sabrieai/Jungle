class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
