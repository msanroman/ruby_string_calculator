require 'string_splitter'

describe "StringSplitter" do

	before(:each) do
		@splitter = StringSplitter.new
	end

	it 'handles commas as delimiters' do
		@splitter.split("1,2,3,4").should == ["1","2","3","4"]
	end

	it 'handles \n as delimiters too' do
		@splitter.split("1\n2,3").should == ["1","2","3"]
	end

	it 'handles custom delimiters' do
		@splitter.split("//;\n1;2").should == ["1","2"]
	end

	it 'handles delimiters of any size' do
		@splitter.split("//[***]\n1***2***3").should == ["1","2","3"]
	end

	it 'handles multiple delimiters at the same time' do
		@splitter.split("//[**][%***%]\n1**2%***%3").should == ["1","2","3"]
	end
end