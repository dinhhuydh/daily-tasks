require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TasksHelper, type: :helper do
  describe '#display_urgent_label' do
    context 'when it is urgent' do
      it 'renders urgent text' do
        expect(helper.display_urgent_label(true)).to eq('Urgent')
      end
    end

    context 'when it is not urgent' do
      it 'renders urgent text' do
        expect(helper.display_urgent_label(false)).to eq('Not Urgent')
      end
    end
  end

  describe '#display_important_label' do
    context 'when it is important' do
      it 'renders important text' do
        expect(helper.display_important_label(true)).to eq('Important')
      end
    end

    context 'when it is not important' do
      it 'renders urgent text' do
        expect(helper.display_urgent_label(false)).to eq('Not Urgent')
      end
    end

  end

  describe '#task_action' do
    context 'when task is open' do
      let(:task) { FactoryBot.create(:task, aasm_state: :open) }
      it 'renders Start link' do
        expect(helper.task_action(task)).to include('Start')
      end
    end

    context 'when task is in progress' do
      let(:task) { FactoryBot.create(:task, aasm_state: :in_progress) }
      it 'renders Done link' do
        expect(helper.task_action(task)).to include('Done')
      end
    end
  end
end
