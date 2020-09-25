require "rails_helper"

RSpec.feature "Task list", :type => :feature do
  scenario "User view his tasks" do
    user = FactoryBot.create(:user)
    other_user = FactoryBot.create(:user)
    task_1 = FactoryBot.create(:task, user: user)
    task_2 = FactoryBot.create(:task, user: other_user)

    user_sign_in(user)

    visit tasks_path
    expect(page).to have_content(task_1.description)
    expect(page).not_to have_content(task_2.description)
  end
end
