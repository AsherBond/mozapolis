module ApplicationHelper
	def link_to_icon(icon, title, url)
		link_to "<i class='icon-#{icon}'></i> #{title}".html_safe, url
	end
	def make_css_for(css_class,attribute,value,append=nil,prepend=nil)

		if value == "FFFFFF" || value.blank?
			# Do nothing
		else
			if attribute == "background-image"
				"#{css_class} { #{attribute}: url(#{value}); }" unless value.nil?
			else
				"#{css_class} { #{attribute}: #{append}#{value}; }" unless value.nil?
			end
		end
	end

end
