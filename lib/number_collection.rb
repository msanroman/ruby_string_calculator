class NumberCollection < Array

	def initialize(collection)
		collection.each{|element|
			self << element.to_i if is_number? element
		}
	end

	def negatives
		self.select{|number| number < 0}
	end

	def is_number?(number)
  	number.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) == nil ? false : true
  end
end