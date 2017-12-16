class Api::V1::SnippetController < Api::V1::ApplicationController
	before_action :find_user



  def index
      if @user
        render json: Snippet.all
      else
        render json: {
          success: false,
          message: "Invalid Access"
        }
      end
    
  end

	def create
		if @user
			@snippet = Snippet.new(snippet_params.merge(user_id: @user.try(:id)))
			if @snippet.save
				render json: @snippet
			else
				render json: {
					success: false,
					message: @snippet.errors.full_messages.join(", ")
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
      if @user.update_attributes(snippet_params)
        render json: {
           success: true,
           message: "Snippet successfully Updated"
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

  def snippet_params
    params.require(:snippet).permit(:name, :content)   
  end

end