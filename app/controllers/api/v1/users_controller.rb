class Api::V1::UsersController < ApplicationController  
  skip_before_action :authenticate_request, only: [:create, :update, :destroy]
  #before_action :authenticate_request


  
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  
  def show
    @user = User.find_by(id:params[:id])
    if @user.present?
      render json: { data:Api::V1::UserSerializer.new(@user).as_json}, status: :ok
    else
      render json: { errors: 'Record not found.'}, status: :ok
    end
  end


  def create
    user = User.new(user_params)
    if user.save
      UserMailer.with(user: user).welcome_email.deliver_now
      flash[:success] = "Thank you for sign up"
      token = jwt_encode(user_id: user.id)
      return render json: { token: token,data: Api::V1::UserSerializer.new(user)}
     else
      flash.now[:error] = " Please check the form and resubmit."
      return render json: {errors: format_activerecord_errors(user.errors)},
          status: :unprocessable_entity 
    end  
  end

  #   if @user.save
  #     token = jwt_encode(user_id: @user.id)
  #     render json: {token: token, data:UserSerializer.new(@user)}, status: :created
  #   else
  #     render json: { errors: @user.errors.full_messages },
  #            status: :unprocessable_entity
  #   end   
  # end

  def update
    user = User.find_by(id:params[:id])
    if user.present?
      user.update(update_params)
     render json: {data:Api::V1::UserSerializer.new(user).as_json}
    else
      render json: {errors: user.errors.full_messages}
    end   
  end


 def destroy
    @user = User.find_by(id:params[:id])
  if @user.delete
    render json: { massage: 'deleted successfully'}, status: :unprocessable_entity
  else
    render json: {data:Api::V1::UserSerializer.new(@user)}
  end
 end


  private

  def update_params   
   params.permit(:id, :username, :picture, :frist_name, :last_name, :technology, :age, :date_of_birth, :address, :experince)
  end


  def user_params
    params.permit(:username, :email, :password, :company_id)
  end
end