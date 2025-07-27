# Clear existing data
LessonExercise.destroy_all
Flight.destroy_all
Exercise.destroy_all
Lesson.destroy_all

puts "Seeding data..."

exercise_names = ["Takeoff Practice", "Landing Drill", "Instrument Reading", "Emergency Procedure"]
exercises = exercise_names.map do |name|
  Exercise.create!(name: name)
end

3.times do |i|
  lesson = Lesson.create!(lesson_number: "L#{100 + i}")
  exercises.sample(3).each do |exercise|
    LessonExercise.create!(
      lesson: lesson,
      exercise: exercise,
      score: rand(1..10),
      comment: ["Good", "Needs improvement", "Excellent", nil].sample
    )
  end

  base_time = Time.now + i.days
  Flight.create!(
    lesson: lesson,
    off: base_time + 1.hour,
    to: base_time + 2.hours,
    lan: base_time + 3.hours,
    on: base_time + 3.hours + 15.minutes,
    eta: base_time + 3.hours + 10.minutes,
    status: %w[scheduled en_route landed].sample
  )
end

# Create a lesson first
lesson = Lesson.create!(
  lesson_number: "Lesson 11"
)

# Create a flight with ETA
Flight.create!(
  lesson: lesson,
  off: DateTime.parse("2024-03-19 11:45:00"),
  to: DateTime.parse("2024-03-19 11:50:00"),
  lan: DateTime.parse("2024-03-19 12:05:00"),
  on: DateTime.parse("2024-03-19 12:10:00"),
  eta: DateTime.parse("2024-03-19 12:10:00"),
  status: "en_route"
)

puts "Flight record created with ETA: 12:10"

puts "Seed complete."
