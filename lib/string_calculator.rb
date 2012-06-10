class StringSplitter

	def split_to_i(string)
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

class String
	def is_number?
  	match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) == nil ? false : true
  end
end

class NumberCollection < Array

	def initialize(collection)
		collection.each{|element|
			self << element.to_i if element.is_number?
		}
	end

	def negatives
		self.select{|number| number < 0}
	end
end

class StringCalculator

	MAXIMUM_NUMBER = 1000

	def initialize(splitter)
		@splitter = splitter
	end

	def add(numbers)
		numbers = NumberCollection.new(@splitter.split_to_i(numbers))
		negatives = numbers.negatives
		raise Exception.new("Negatives not allowed: #{negatives.inspect}") if negatives.any?
		small_enough(numbers).inject(0){|sum, number| sum + number}
	end

	def small_enough(numbers)
		numbers.select{|number| not is_too_big? number}
	end

	def is_too_big? (number)
		number > MAXIMUM_NUMBER
	end
end