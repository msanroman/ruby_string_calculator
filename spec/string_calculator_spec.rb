$: << File.join(File.dirname(__FILE__), "/../lib")
require 'string_calculator'

describe 'String calculator' do
	
	it 'returns 0 for no input' do
		StringCalculator.new.add("").should == 0
	end

	it 'returns the number passed as input for one number' do
		StringCalculator.new.add("1").should == 1
	end

	it 'returns the sum of all separated by comma numbers provided' do
		StringCalculator.new.add("1,2,3,4").should == 10
	end

	it 'handles \n as delimiters too' do
		StringCalculator.new.add("1\n2,3").should == 6
	end

	it 'handles custom delimiters' do
		StringCalculator.new.add("//;\n1;2").should == 3
	end

	it 'raises an exception when passing negative numbers' do
		expect {
			StringCalculator.new.add("-1,2")
			}.to raise_error ('Negatives not allowed: ["-1"]')
	end

	it 'ignores numbers greater than 1000' do
		StringCalculator.new.add("2,1001").should == 2
	end
end