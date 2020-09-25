require "rails_helper"

RSpec.feature "Display closed tasks", :type => :feature, js: true do
  scenario "Display closed tasks" do
    user = FactoryBot.create(:user)
    task = FactoryBot.create(:task, user: user)
    closed_task = FactoryBot.create(:task, user: user, aasm_state: :closed)
    user_sign_in(user)

    visit tasks_path
    expect(page).to have_content(task.description)
    expect(page).not_to have_content(closed_task.description)

    check 'show closed tasks'
    expect(page).to have_content(closed_task.description)
    expect(page).to have_content(task.description)
  end
end
