require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Preparation do
  before(:each) do
   @preparation = Factory.build(:preparation)
  end

  it "should be valid by default" do
    @preparation.should be_valid
  end
end
