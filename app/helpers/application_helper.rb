module ApplicationHelper
	
	#return the full title for current page
	def full_title(page_title)
		base_title = "Address D Mess"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
