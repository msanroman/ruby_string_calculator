class StringCalculator

	MAXIMUM_NUMBER = 1000

	def initialize(splitter)
		@splitter = splitter
	end

	def add(numbers)
		numbers = NumberCollection.new(@splitter.split(numbers))
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