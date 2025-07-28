# spec/controllers/lessons_controller_spec.rb
require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  describe "GET #index" do
    let!(:lesson1) { create(:lesson) }
    let!(:lesson2) { create(:lesson) }

    let!(:exercise1) { create(:exercise, name: "A") }
    let!(:exercise2) { create(:exercise, name: "B") }

    before do
      create(:lesson_exercise, lesson: lesson1, exercise: exercise1, score: 90)
      create(:lesson_exercise, lesson: lesson2, exercise: exercise1, score: 80)
      create(:lesson_exercise, lesson: lesson1, exercise: exercise2, score: 70)

      get :index
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "assigns all lessons to @lessons" do
      expect(assigns(:lessons)).to match_array([lesson1, lesson2])
    end

    it "assigns aggregated exercise stats to @all_exercises" do
      expect(assigns(:all_exercises).map(&:id)).to match_array([exercise1.id, exercise2.id])
    end

    it "includes usage_count and avg_score in the results" do
      stats = assigns(:all_exercises).find { |e| e.id == exercise1.id }

      expect(stats.usage_count.to_i).to eq(2)
      expect(stats.avg_score.to_f).to be_within(0.01).of(85.0)  # (90 + 80) / 2
    end
  end
end
