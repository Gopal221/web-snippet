class Api::V1::UserController < Api::V1::ApplicationController

  def create_token
    if @user = current_user
      @api = Api.new(user_id: @user.try(:id), access_token: (Digest::SHA1.hexdigest "#{Time.now.to_i}#{1}"))
      if @api.save
        render json: @api
      else
        render json: {
          success: false,
          message: @api.errors.full_messages.join(", ")
        }
      end
    else
      render json: {
          success: false,
          message: "Invalid Access"
        }
    end
    
  end


end
