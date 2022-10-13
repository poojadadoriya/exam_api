class CreateHelpSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :help_supports do |t|
      t.string :help
      t.text :support
      t.timestamps
    end
  end
end
