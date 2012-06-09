class StringCalculator

		def add(numbers)
			custom_delimiter = get_custom_delimiter(numbers)
			regexp = "[,\\\n#{custom_delimiter}]"
			result = numbers.split(/#{regexp}/).inject(0) {|sum, number|
				sum + number.to_i
			}
			return result
		end

		def get_custom_delimiter(numbers)
			if numbers.start_with? "//"
				return numbers[2...numbers.index("\n")]
			end
		end
end