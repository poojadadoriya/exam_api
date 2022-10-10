class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :total_no_of_question
      t.string :technology
      t.string :exam_day
      t.datetime :start_time
      t.datetime :end_time
      
      t.timestamps
    end
  end
end
