FactoryBot.define do
  factory :user, aliases: [:owner] do
    name {"Test"}
    sequence(:email) { |n| "test#{n}@example.com" }
    password {"password"}
    password_confirmation {"password"}
  end
end
