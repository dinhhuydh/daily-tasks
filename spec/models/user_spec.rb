require 'rails_helper'

RSpec.describe User, type: :model do
  let(:password) { 'Abc123456' }
  describe '#validate' do
    it 'has username length greater than or equal 4' do
      user = User.new(username: 'abc', password: password)
      expect(user.valid?).to be_falsy
    end

    it 'has username length less than or equal 16' do
      invalid_username = 'a' * 17
      user = User.new(username: invalid_username)
      expect(user.valid?).to be_falsy
    end

    it 'has username length between 4 and 16' do
      valid_username = 'a' * 15
      user = User.new(username: valid_username, password: password)
      expect(user.valid?).to be_truthy
    end
  end
end
