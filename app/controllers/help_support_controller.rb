class HelpSupportController < ApplicationController
 def create
  # user = User.all
  #   if user.present?
      help = HelpSupport.create(help_params)
      if help.save
      render json: {message: 'Done'}  
    else
      render json: {message: 'Record not found'}
    end
  end


  
  def help_params
    params.permit(:help, :user_id)
  end
end