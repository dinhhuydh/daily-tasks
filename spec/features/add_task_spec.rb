require "rails_helper"

RSpec.feature "Add New Task", :type => :feature, js: true do
  scenario "User add a new task" do
    user = FactoryBot.create(:user)

    user_sign_in
    visit 'sessions/new'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'Abc123Abc'

    click_on 'Sign in'

    visit tasks_path
    expect(page).to have_button('Add')

    description = FactoryBot.build(:task).description
    fill_in 'Enter your task', with: description
    choose 'Important'
    click_on 'Add'

    within('#task-list') do
      expect(page).to have_content(description)
      expect(page).to have_content('Important')
    end
  end
end
