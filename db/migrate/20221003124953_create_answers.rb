class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :answer_of_question
      t.references :question, index: true

      t.timestamps
    end
  end
end
