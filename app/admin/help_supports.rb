ActiveAdmin.register HelpSupport do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :help, :support, :user_id

   index do 
    selectable_column
    id_column
    column :user_id do |h|
       h.user_id
     end
    column :help
    column :support
    column :created_at
    column :updated_at
    actions
  end






   filter :user_id

   form do |f|
    f.inputs  do
      f.input :user, :label => 'user', :as => :select, :collection => User.all.collect{|c| c.id}
      f.input :help
      f.input :support
    end
    actions
   end


   show do |h|
    attributes_table do
       row "user_id" do
         h.user
       end
     end
   end



  #
  # or
  #
  # permit_params do
  #   permitted = [:help, :support]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
