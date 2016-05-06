require_relative 'spec_helper'
# "Before each" blocks are run before every test
# and they're commonly used to do some setup.
# In this case we're creating a new robot and storing it in the @robot instance variable.
# The pound symbol is a convention to imply that position is a callable method
# This test is basically saying that it expects @robot.position == [0, 0]
# It's important to read the contents of the test to see what it's testing for
# Btw: an "it" is a test.
# The string "has ability to #move_left one tile at a time" is just a description of what is being tested.
describe Robot do
  before :each do
    @robot = Robot.new
    @item1 = Item.new("item1", 10)
    @item2 = Item.new("item2", 30)
    @light_item = Item.new("light item", 1)
    @max_weight_item = Item.new("max weight item", 250)
  end

  describe "#items" do
    it "should return empty array" do
      expect(@robot.items).to eq([])
    end
  end

  # Recall that since it is using a "#" in the description,
  # we are describing/expecting a pick_up instance method
  describe "#pick_up" do
    it "adds item to items" do
      @robot.pick_up(@item1)
      expect(@robot.items).to include(@item1)

      # add item2 to collection of items, and make sure it's there when we call #items
      @robot.pick_up(@item2)
      expect(@robot.items).to include(@item2)
    end
  end

  describe "#items_weight" do
    it "should be zero" do
      expect(@robot.items_weight).to eq(0)
    end

    it "should report back total weight of items that have been picked up" do
      @robot.pick_up(@item1)
      @robot.pick_up(@item2)
      expect(@robot.items_weight).to eq(40)
    end
  end

  describe "capacity" do
    it "can only carry a maximum of 250 lbs" do
      expect(@robot.pick_up(@max_weight_item)).to be_truthy
      expect(@robot.pick_up(@light_item)).to be_falsey
      expect(@robot.items_weight).to eq(250)
    end
  end
end
