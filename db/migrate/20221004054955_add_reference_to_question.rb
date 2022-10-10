class AddReferenceToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :technology, index:true
  end
end
