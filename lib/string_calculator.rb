class StringCalculator

		def add(numbers)
			custom_delimiter = get_custom_delimiter(numbers)
			regexp = "[,\\\n#{custom_delimiter}]"
			numbers = numbers.split(/#{regexp}/)
			negatives = negatives(numbers)
			raise Exception.new("Negatives not allowed: #{negatives.inspect}") if negatives.any?
			numbers.inject(0) {|sum, number|
				if is_too_big? number.to_i
					sum + 0
				else sum + number.to_i
				end
			}
		end

		def is_too_big? (number)
			number > 1000
		end

		def negatives(numbers)
			numbers.select{|number| number.to_i < 0}
		end

		def get_custom_delimiter(numbers)
			if numbers.start_with? "//"
				return numbers[2...numbers.index("\n")]
			end
		end
end