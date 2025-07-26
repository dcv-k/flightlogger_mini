class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.datetime :off
      t.datetime :to
      t.datetime :lan
      t.datetime :on
      t.string :status
      t.datetime :eta
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
