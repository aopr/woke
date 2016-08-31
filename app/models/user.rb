class User < ApplicationRecord
  validates :email, presence: true
  has_secure_password

  attr_accessor :first_name,:last_name, :email


end
