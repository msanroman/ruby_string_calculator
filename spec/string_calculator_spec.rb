$: << File.join(File.dirname(__FILE__), "/../lib")
require 'string_calculator'

describe 'String calculator' do
	
	it 'Returns 0 for no input' do
		StringCalculator.new.add('').should == 0
	end
end