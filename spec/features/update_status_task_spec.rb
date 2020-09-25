require "rails_helper"

RSpec.feature "Update task status", :type => :feature, js: true do
  scenario "User updates his task" do
    user = FactoryBot.create(:user)
    task = FactoryBot.create(:task, user: user)
    user_sign_in(user)

    visit tasks_path
    expect(page).to have_content(task.description)

    click_link 'Start'
    expect(page).to have_link('Done')

    click_link 'Done'
    expect(page).not_to have_content(task.description)
  end
end
