class User < ApplicationRecord
  has_secure_password
  validates_length_of :username, minimum: 4, maximum: 16
  validates_format_of :username, :with => /\A[a-zA-Z0-9_\-]+\z/

  validates_length_of :password, minimum: 8, maximum: 16
  validate :strong_password_checker

  has_many :tasks, dependent: :destroy

  private

  def strong_password_checker
    if !password.match(/[A-Z]/) || !password.match(/[a-z]/) || !password.match(/[0-9]/)
      errors.add(:password, 'Not contains at least 1 upper case, 1 lower case and 1 number')
    end
  end
end
