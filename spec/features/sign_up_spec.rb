require "rails_helper"

RSpec.feature "Sign up ", :type => :feature do
  scenario "User signs up new account successfully" do
    visit "/users/new"

    expect(page).to have_text('New User')
    expect(page).to have_text('Username')
    expect(page).to have_text('Password')

    fill_in 'Username', with: 'Mahatta'
    fill_in 'Password', with: 'StrongPasword123'
    fill_in 'Password confirmation', with: 'StrongPasword123'

    click_on 'Create User'

    expect(page).to have_text('User was successfully created.')
  end
end
