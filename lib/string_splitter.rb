class StringSplitter

	def split(string)
		custom_delimiter = get_custom_delimiter(string)
		regexp = "[,\\\n#{custom_delimiter}]"
		string = trim_custom_delimiter(string, custom_delimiter)
		result = string.split(/#{regexp}/).select{|element| not element.empty?}
	end

	def trim_custom_delimiter(string, custom_delimiter)
		unless custom_delimiter.nil?
			string.slice!(0..2+custom_delimiter.length)
		end
		string
	end

	def get_custom_delimiter(string)
		if string.start_with? "//"
			return string[2...string.index("\n")]
		end
	end
end