class Api::V1::QuestionController < ApplicationController


  def show
    tech = Technology.find_by(id:params[:id])
    ques = tech.questions
    if tech.present?

      render json: ques 
    else
      render json: {message: 'Record not found'}
    end
  end


  private
    def tech_params
      params.require(:data).permit(:image)
    end
end 