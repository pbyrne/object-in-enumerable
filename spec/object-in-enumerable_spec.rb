require File.join(File.dirname(__FILE__), "/spec_helper")

describe Object do
  context "knowing whether it is in the given object" do
    before(:each) do
      @enum = [1, "B", Date.today, {:foo => "bar"}, nil]
      @string = "abcdefg"
    end
    
    it "should know when it is in the given array" do
      1.in?(@enum).should be_true
      "B".in?(@enum).should be_true
      Date.today.in?(@enum).should be_true
      {:foo => "bar"}.in?(@enum).should be_true
      nil.in?(@enum).should be_true
    end
    
    it "should know when it is not in the given array" do
      2.in?(@enum).should be_false
      "C".in?(@enum).should be_false
      Date.new(2000, 01, 01).in?(@enum).should be_false
      {:bing => "bang"}.in?(@enum).should be_false
    end

    it "should know when it is in a non-enumerable object" do
      "a".in?("abc").should be_true
      "ABC".in?("ABCDEFG").should be_true
      1.in?(1..5).should be_true
    end
    
    it "should know when it is not in a non-enumerable object" do
      "d".in?("abc").should be_false
      "Z".in?("xyz").should be_false
      1.in?(5..10).should be_false
    end
    
    it "should return nil if the given enumerable doesn't respond to include?" do
      1.in?(1).should be_nil
      "foo".in?(nil).should be_nil
    end
  end
end