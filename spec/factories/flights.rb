FactoryBot.define do
  factory :flight do
    lesson
    off { Time.now + 1.hour }
    to { Time.now + 2.hours }
    lan { Time.now + 3.hours }
    on { Time.now + 3.hours + 15.minutes }
    eta { Time.now + 3.hours + 10.minutes }
    status { ['scheduled', 'en_route', 'landed', 'completed'].sample }
  end
end
