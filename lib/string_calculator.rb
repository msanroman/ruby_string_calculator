class StringCalculator

		def add(numbers)
			return numbers.split(/[,\\n]/).inject(0) {|sum, number|
				sum + number.to_i
			}
		end
end