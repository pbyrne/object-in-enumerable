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
      
      1.not_in?(@enum).should be_false
      "B".not_in?(@enum).should be_false
      Date.today.not_in?(@enum).should be_false
      {:foo => "bar"}.not_in?(@enum).should be_false
      nil.not_in?(@enum).should be_false
    end
    
    it "should know when it is not in the given array" do
      2.in?(@enum).should be_false
      "C".in?(@enum).should be_false
      Date.new(2000, 01, 01).in?(@enum).should be_false
      {:bing => "bang"}.in?(@enum).should be_false
      
      2.not_in?(@enum).should be_true
      "C".not_in?(@enum).should be_true
      Date.new(2000, 01, 01).not_in?(@enum).should be_true
      {:bing => "bang"}.not_in?(@enum).should be_true
    end

    it "should know when it is in a non-enumerable object" do
      "a".in?("abc").should be_true
      "ABC".in?("ABCDEFG").should be_true
      1.in?(1..5).should be_true
      
      "a".not_in?("abc").should be_false
      "ABC".not_in?("ABCDEFG").should be_false
      1.not_in?(1..5).should be_false
    end
    
    it "should know when it is not in a non-enumerable object" do
      "d".in?("abc").should be_false
      "Z".in?("xyz").should be_false
      1.in?(5..10).should be_false
      
      "d".not_in?("abc").should be_true
      "Z".not_in?("xyz").should be_true
      1.not_in?(5..10).should be_true
    end
    
    it "should return nil if the given enumerable doesn't respond to include?" do
      1.in?(1).should be_nil
      "foo".in?(nil).should be_nil
      
      1.not_in?(1).should be_nil
      "foo".not_in?(nil).should be_nil
    end
  end
end