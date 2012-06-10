$: << File.join(File.dirname(__FILE__), "/../lib")
require 'string_calculator'

describe 'String calculator' do
	
	before(:each) do
		@splitter = double("StringSplitter")
		@calculator = StringCalculator.new(@splitter)
	end
	
	it 'returns 0 for no input' do
		@splitter.stub(:split_to_i).and_return(([]))
		@calculator.add("").should == 0
	end

	it 'returns the number passed as input for one number' do
		@splitter.stub(:split_to_i).and_return((["1"]))
		@calculator.add("1").should == 1
	end

	it 'gets the splitted numbers from the StringSplitter class' do
		@splitter.should_receive(:split_to_i).with("1,2,3,4").and_return((["1","2","3","4"]))
		@calculator.add("1,2,3,4")
	end

	it 'returns the sum of all numbers provided' do
		@splitter.stub(:split_to_i).and_return((["1","2","3","4"]))
		@calculator.add("1,2,3,4").should == 10
	end


	it 'raises an exception when passing negative numbers' do
		@splitter.stub(:split_to_i).and_return((["-1","2"]))
		expect {
			@calculator.add("-1,2")
			}.to raise_error ('Negatives not allowed: [-1]')
	end

	it 'ignores numbers greater than 1000' do
		@splitter.stub(:split_to_i).and_return((["2","1001"]))
		@calculator.add("2,1001").should == 2
	end
end

describe "StringSplitter" do

	before(:each) do
		@splitter = StringSplitter.new
	end

	it 'handles commas as delimiters' do
		@splitter.split_to_i("1,2,3,4").should == ["1","2","3","4"]
	end

	it 'handles \n as delimiters too' do
		@splitter.split_to_i("1\n2,3").should == ["1","2","3"]
	end

	it 'handles custom delimiters' do
		@splitter.split_to_i("//;\n1;2").should == ["1","2"]
	end

	it 'handles delimiters of any size' do
		@splitter.split_to_i("//[***]\n1***2***3").should == ["1","2","3"]
	end
end

describe "NumberCollection" do

	it 'gets an string collection and stores as numbers' do
		collection = NumberCollection.new(["1","2","3","4"])
		collection.should == [1,2,3,4]
	end

	it 'returns the subset of negative numbers on negatives method' do
		collection = NumberCollection.new(["-1","2"])
		collection.negatives.should == [-1]
	end
end