module ApplicationHelper


#Returns full title on a page per tilte basis
	def full_title(page_title)
		base_title="Lets Tweet"
	
		if page_title.empty?
			base_title
		else
			"#{base_title}|#{page_title}"
		end
	
	end
end
