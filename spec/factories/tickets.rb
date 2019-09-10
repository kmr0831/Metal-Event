FactoryBot.define do
  factory :ticket do
    sequence(:comment) {|n| "Comment #{n}" }
    association :event
    association :user
  end
end
