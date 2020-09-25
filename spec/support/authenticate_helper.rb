module AuthenticateHelper
  def user_sign_in(user)
    visit 'sessions/new'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'Abc123Abc'

    click_on 'Sign in'
  end
end

RSpec.configure do |config|
  config.include AuthenticateHelper, type: :feature
end
