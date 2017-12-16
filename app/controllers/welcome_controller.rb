
class WelcomeController < ApplicationController

	def index
	end


	def snippet
		if current_user
			@my_snippet = current_user.snippets
		end
	end
end
