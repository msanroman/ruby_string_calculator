$: << File.join(File.dirname(__FILE__), "/../lib")
require 'string_calculator'

describe 'String calculator' do
	
	it 'Returns 0 for no input' do
		StringCalculator.new.add('').should == 0
	end

	it 'Returns the number passed as input for one number' do
		StringCalculator.new.add('1').should == 1
	end

	it 'For any amount of numbers separated by comma will return its sum' do
		StringCalculator.new.add('1,2,3,4').should == 10
	end

	it 'Can handle \n instead of commas' do
		StringCalculator.new.add('1\n2,3').should == 6
	end
end