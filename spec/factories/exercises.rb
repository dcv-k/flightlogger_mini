FactoryBot.define do
  factory :exercise do
    sequence(:name) { |n| "Exercise #{n}" }
  end
end