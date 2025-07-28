# Clear existing data
LessonExercise.destroy_all
Flight.destroy_all
Exercise.destroy_all
Lesson.destroy_all

puts "Seeding data..."

# All exercise names from the flight training table
exercise_names = [
  "R/T procedures",
  "Start up procedures",
  "Engine fire on ground",
  "Takeoff",
  "Engine failure during takeoff",
  "Climb out",
  "Engine failure",
  "Field landing",
  "Approach",
  "Glide landing clean",
  "Glide landing landing conf."
]

exercises = exercise_names.map do |name|
  Exercise.create!(name: name)
end

puts "Created #{exercises.count} exercises"

# Create lessons with realistic flight training progression
5.times do |i|
  lesson = Lesson.create!(lesson_number: "L#{100 + i}")

  # Select appropriate exercises based on lesson progression
  case i
  when 0
    # First lesson - basic procedures
    selected_exercises = exercises.select { |e| ["R/T procedures", "Start up procedures", "Takeoff"].include?(e.name) }
  when 1
    # Second lesson - basic flight maneuvers
    selected_exercises = exercises.select { |e| ["Takeoff", "Climb out", "Approach"].include?(e.name) }
  when 2
    # Third lesson - emergency procedures
    selected_exercises = exercises.select { |e| ["Engine failure", "Field landing", "Glide landing clean"].include?(e.name) }
  when 3
    # Fourth lesson - advanced procedures
    selected_exercises = exercises.select { |e| ["Engine failure during takeoff", "Engine fire on ground", "Glide landing landing conf."].include?(e.name) }
  else
    # Advanced lesson - mixed exercises
    selected_exercises = exercises.sample(4)
  end

  selected_exercises.each do |exercise|
    # Realistic scoring based on exercise difficulty
    difficulty_scores = {
      "R/T procedures" => [7, 8, 9],
      "Start up procedures" => [8, 9, 10],
      "Takeoff" => [6, 7, 8, 9],
      "Climb out" => [7, 8, 9],
      "Approach" => [5, 6, 7, 8],
      "Engine failure" => [4, 5, 6, 7],
      "Engine failure during takeoff" => [3, 4, 5, 6],
      "Engine fire on ground" => [5, 6, 7],
      "Field landing" => [4, 5, 6, 7],
      "Glide landing clean" => [5, 6, 7, 8],
      "Glide landing landing conf." => [6, 7, 8]
    }

    score = difficulty_scores[exercise.name]&.sample || rand(5..8)

    comments = [
      "Excellent execution",
      "Good improvement shown",
      "Needs more practice",
      "Well done",
      "Focus on precision",
      "Safety procedures followed well",
      "Smooth performance",
      nil, nil # Some exercises might not have comments
    ]

    LessonExercise.create!(
      lesson: lesson,
      exercise: exercise,
      score: score,
      comment: comments.sample
    )
  end

  # Create corresponding flight records
  base_time = Time.now + i.days
  Flight.create!(
    lesson: lesson,
    off: base_time + 1.hour,
    to: base_time + 2.hours,
    lan: base_time + 3.hours,
    on: base_time + 3.hours + 15.minutes,
    eta: base_time + 3.hours + 10.minutes,
    status: ['scheduled', 'en_route', 'landed', 'completed'].sample
  )

  puts "Created lesson #{lesson.lesson_number} with #{selected_exercises.count} exercises"
end

# Create the specific lesson from your original seed
lesson = Lesson.create!(
  lesson_number: "Lesson 11"
)

# Add some exercises to this lesson as well
sample_exercises = exercises.sample(3)
sample_exercises.each do |exercise|
  LessonExercise.create!(
    lesson: lesson,
    exercise: exercise,
    score: rand(6..9),
    comment: ["Good progress", "Needs refinement", "Excellent work"].sample
  )
end

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

# Create some additional exercises for comprehensive training data
puts "\nCreating additional training scenarios..."

# Create sub-exercises for "Start up procedures" to match the interface
startup_lesson = Lesson.create!(lesson_number: "L200")
startup_exercise = exercises.find { |e| e.name == "Start up procedures" }

if startup_exercise
  LessonExercise.create!(
    lesson: startup_lesson,
    exercise: startup_exercise,
    score: 7,
    comment: "Study SOP further - Progress: Step 3 of 5"
  )

  puts "Created detailed startup procedures lesson"
end

puts "\nSeed complete!"
puts "Created:"
puts "- #{Exercise.count} exercises"
puts "- #{Lesson.count} lessons"
puts "- #{LessonExercise.count} lesson exercises"
puts "- #{Flight.count} flights"