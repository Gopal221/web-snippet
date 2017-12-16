class Api::V1::PermissionController < Api::V1::ApplicationController
	before_action :find_user

	def create
		if @user
			@permission = Permission.new(permission_params)
			if @permission.save
				render json: @permission
			else
				render json: {
					success: false,
					message: @permission.errors.full_messages.join(", ")
				}
			end
		else
			render json: {
					success: false,
					message: "Invalid Access"
				}
		end
	end


	def update
    if @user
      if @user.update_attributes(permission_params)
        render json: {
           success: true,
           message: "permission successfully Updated"
          }
      else
        render json: {
         success: false,
         message: @user.errors.full_messages.join(", ")
        }
      end
    else
      render json: {
         success: false,
         message: "Invalid access"
        }
    end
  end




	private

	def find_user
    @user = Api.where(access_token: params[:access_token]).first.user || current_user
  end

  def permission_params
    params.require(:snippet).permit(:user_id, :snippet_id)   
  end

end