class AddReferenceToOption < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :option, index:true
  end
end
