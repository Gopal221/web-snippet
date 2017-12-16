class Api::V1::RegistrationsController < Api::V1::ApplicationController


  def create
    @user = User.new({:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation]})
    if @user.save
      render json: {
       success: true,
       message: "successfully signup",
       access_token:  generate_access_token(params[:user_id], @user.id).access_token
      }
    else
      render json: {
       success: false,
       message: @user.errors.full_messages.join(", ")
      }
    end
  end

end
