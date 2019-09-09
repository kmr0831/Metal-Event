FactoryBot.define do
  factory :event do
    sequence(:name) {|n| "Event #{n}" }
    sequence(:place) { |n| "Place #{n}" }
    sequence(:content) { |n| "Content #{n}" }
    start_time { rand(1..30).days.from_now }
    end_time { start_time + rand(1..30).hours }
    association :owner
  end
end
