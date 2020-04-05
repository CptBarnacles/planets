class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	add_flash_types :danger, :info, :warning, :success
	include SessionsHelper
	include UsersHelper
	before_action :logged_in?

	def current_shopping_cart
		if current_user
			@cart = @user.cart
		else
			if session[:shopping_cart]
				@cart = Cart.find(session[:cart])
			else
				@cart = Cart.create
				session[:cart] = @card.id
			end
		end
	end
end
