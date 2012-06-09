$: << File.join(File.dirname(__FILE__), "/../lib")
require 'string_calculator'

describe 'String calculator' do
	
	it 'Returns 0 for no input' do
		StringCalculator.new.add("").should == 0
	end

	it 'Returns the number passed as input for one number' do
		StringCalculator.new.add("1").should == 1
	end

	it 'For any amount of numbers separated by comma will return its sum' do
		StringCalculator.new.add("1,2,3,4").should == 10
	end

	it 'Handles \n as delimiters too' do
		StringCalculator.new.add("1\n2,3").should == 6
	end

	it 'Handles custom delimiters' do
		StringCalculator.new.add("//;\n1;2").should == 3
	end
end