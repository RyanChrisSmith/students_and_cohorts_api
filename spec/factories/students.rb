FactoryBot.define do
  factory :student do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    preferred_name {Faker::Name.name}
    pronouns {Faker::Gender.short_binary_type}
    email {Faker::Internet.email}
    github_username {Faker::Internet::username}
    slack_username {Faker::Internet.domain_name}
    cohort
  end
end
