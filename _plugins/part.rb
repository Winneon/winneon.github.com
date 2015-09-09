module Jekyll
	module Part
		def part(text)
			if text.include? "<!-- start -->" and text.include? "<!-- end -->"
				text.split("<!-- start -->")[1].split("<!-- end -->")[0]
			else
				text
			end
		end
	end
end

Liquid::Template.register_filter(Jekyll::Part)