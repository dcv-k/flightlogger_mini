FactoryBot.define do
  factory :lesson do
    sequence(:lesson_number) { |n| "L#{100 + n}" }
  end
end