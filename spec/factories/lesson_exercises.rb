FactoryBot.define do
  factory :lesson_exercise do
    lesson
    exercise
    score { rand(4..10) }
    comment { ["Good progress", "Needs refinement", "Excellent work"].sample }
  end
end