class User < ApplicationRecord
  has_secure_password
  validates_length_of :username, minimum: 4, maximum: 16
end
