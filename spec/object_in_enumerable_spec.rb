require 'rspec'
require 'object-in-enumerable'

describe Object do
  context "knowing whether it is in the given enumerable" do
    let(:enum) { [1, "B", Date.today, {:foo => "bar"}, nil] }

    it "should know when it is in the given array" do
      enum.each do |entry|
        entry.in?(enum).should be_true
        entry.not_in?(enum).should be_false
      end
    end

    it "should know when it is NOT in the given array" do
      2.in?(enum).should be_false
      "C".in?(enum).should be_false
      Date.new(2000, 1, 1).in?(enum).should be_false
      {:bing => "bang"}.in?(enum).should be_false

      2.not_in?(enum).should be_true
      "C".not_in?(enum).should be_true
      Date.new(2000, 1, 1).not_in?(enum).should be_true
      {:bing => "bang"}.not_in?(enum).should be_true
    end

    it "should know when it is in a non-enumerable object responding to :include?" do
      "a".in?("abc").should be_true
      "ABC".in?("ABCDEFG").should be_true
      1.in?(1..5).should be_true

      "a".not_in?("abc").should be_false
      "ABC".not_in?("ABCDEFG").should be_false
      1.not_in?(1..5).should be_false
    end

    it "should know when it is not in a non-enumerable object responding to :include?" do
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
