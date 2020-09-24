FactoryBot.define do
  factory :task do
    description { Faker::Lorem.sentence(word_count: 3)  }
    user
  end
end
