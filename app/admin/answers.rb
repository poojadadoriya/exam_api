ActiveAdmin.register Answer do

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
     permit_params :answer_of_question, :question_id, :option_id
    #
    # or
    #
    # permit_params do
    #   permitted = [:answer_of_question, :question_id]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end


    index do
      selectable_column
      id_column
      column :answer_of_question
      column :question_id do |answer|
        answer.question.description
      end
      column :option_id
      column :created_at
      column :updated_at
      actions
    end



    form do |f|
        f.inputs  do
          f.input :option, :label => :option, :as => :select, :collection => Option.all.map{|o|["#{o.content}",o.id]}
          f.input :question_id, :label => :Question, :as => :select, :collection => Question.all.map{|q|["#{q.description}",q.id]}
          f.input :answer_of_question
        end
      f.actions
    end
   


   show do |answer|
    attributes_table do
       row "option" do
         answer.option&.content
       end
      row "question" do
        answer.question&.description
      end
    end
     panel "Table" do
        table_for answer.question do
          column :description
        end
     end
  end

end