module UsersHelper
	def permission?
		unless @user.id != current_user.id
			"help"
		end
	end
end
