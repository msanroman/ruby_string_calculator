$: << File.join(File.dirname(__FILE__), "/../lib")
require 'number_collection'

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