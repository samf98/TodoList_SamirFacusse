class HomeController < ApplicationController
	def return
		redirect_to return_path
	end
end