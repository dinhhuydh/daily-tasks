require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validate username' do
    let(:password) { 'Abc123456' }

    it 'has username length greater than or equal 4' do
      user = User.new(username: 'abc', password: password)
      expect(user.valid?).to be_falsy
    end

    it 'has username length less than or equal 16' do
      invalid_username = 'a' * 17
      user = User.new(username: invalid_username, password: password)
      expect(user.valid?).to be_falsy
    end

    it 'has username length between 4 and 16' do
      valid_username = 'a' * 15
      user = User.new(username: valid_username, password: password)
      expect(user.valid?).to be_truthy
    end

    it 'has username which does not contains special character' do
      invalid_username = '!aaa'
      user = User.new(username: invalid_username, password: password)
      expect(user.valid?).to be_falsy
    end
  end

  describe '#validate password' do
    let(:username) { 'username' }

    it 'has password length greater than or equal 8' do
      password = 'abc123'
      user = User.new(username: username, password: password)
      expect(user.valid?).to be_falsy
    end

    it 'has password length less than or equal 16' do
      password = 'a' * 17
      user = User.new(username: username, password: password)
      expect(user.valid?).to be_falsy
    end

    it 'has password length between 4 and 16' do
      password = 'a' * 15
      user = User.new(username: username, password: password)
      expect(user.valid?).to be_falsy
    end

    it 'has password length between 4 and 16 and have uppercase, lowercase and number' do
      password = 'abc123Abc'
      user = User.new(username: username, password: password)
      expect(user.valid?).to be_truthy
    end
  end
end
