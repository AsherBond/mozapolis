module CommentsHelper
	
	def link_to_artist(username)
		link_to(username, current_artist)
	end
	def link_to_object(title, object)
		link_to(title, object)
	end
	def link_to_fan(username)
		link_to(current_fan.username, current_fan)
	end
end
