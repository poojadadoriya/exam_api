class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :frist_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :technology, :string
    add_column :users, :experince, :integer
    add_reference :users, :company, index: true
  end
end
