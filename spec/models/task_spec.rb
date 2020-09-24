require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#validate description' do
    it { is_expected.to validate_presence_of(:description) }

    it 'has description length less than 40' do
      long_description = 'a' * 41
      task = Task.create(description: long_description)
      expect(task.valid?).to be_falsy
    end
  end
end
