class Api::V1::ApplicationController < ActionController::Base


	def default_serializer_options
	  {root: false}
	end


  def generate_access_token(user_id)
    Api.create(
      access_token: (Digest::SHA1.hexdigest "#{Time.now.to_i}#{1}"),
      user_id: user_id)
  end
end