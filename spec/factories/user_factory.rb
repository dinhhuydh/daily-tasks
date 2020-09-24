FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 4..8) }
    password { 'Abc123Abc' }
  end
end
