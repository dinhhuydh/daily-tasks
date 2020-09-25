require "rails_helper"

RSpec.feature "Destroy task", :type => :feature, js: true do
  scenario "User destroy his task" do
    user = FactoryBot.create(:user)
    task = FactoryBot.create(:task, user: user)
    user_sign_in(user)

    visit tasks_path
    expect(page).to have_content(task.description)

    accept_confirm do
      click_link 'x'
    end
    expect(page).not_to have_content(task.description)
  end
end
