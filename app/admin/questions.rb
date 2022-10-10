ActiveAdmin.register Question do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :description, :technology_id, :image, options_attributes: [:id, :content, :question_id, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :total_no_of_question, :technology, :exam_day, :start_time, :end_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do 
    selectable_column
    id_column
    column :technology do |question|
       question.technology.technology
     end
    column :description
    column :created_at
    column :updated_at

    actions
  end


  form do |f|
    f.inputs  do
      f.input :technology, :label => 'Technology', :as => :select, :collection => Technology.all.collect{|c|[c.technology, c.id]}
      f.input :description
      f.input :image, as: :file
    end
    f.inputs do
      f.has_many :options, heading: 'select option' do |kk|
        kk.input :content
      end 
      f.actions
    end
  end


  show do |question|
    attributes_table do
      row "technology" do
       question.technology.technology
      end
      row "description" do
        question.description
      end
      row "image" do |i|
        image_tag url_for(i.image)
      end
      panel "Table of options" do
        table_for question.options do
          column :content 
        end
      end   
    end
  end

end