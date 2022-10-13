class AddReferenceToHelpSupport < ActiveRecord::Migration[6.0]
  def change
    add_reference :help_supports, :user, index:true 
  end
end
