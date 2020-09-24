require "rails_helper"

RSpec.feature "Sign in ", :type => :feature do
  scenario "User signs in the account unsuccessfully" do
    visit "/sessions/new"

    expect(page).to have_text('Sign in')
    expect(page).to have_text('Username')
    expect(page).to have_text('Password')

    fill_in 'Username', with: 'Mahatta'
    fill_in 'Password', with: 'StrongPasword123'

    click_on 'Sign in'

    expect(page).to have_text("Username or password is invalid")
  end

  scenario "User signs in the account unsuccessfully" do
    password = 'StrongPasword123'
    user = User.create(username: 'Mahatta', password: password)
    visit "/sessions/new"

    expect(page).to have_text('Sign in')
    expect(page).to have_text('Username')
    expect(page).to have_text('Password')

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_on 'Sign in'

    expect(page).to have_text('Logged in!')
  end
end
