require 'test_helper'

class PlateTest < ActiveSupport::TestCase
  
  test "allows plates for dinners" do
    dinner = Dinner.create!
  
    dinner.plates.create weight: 5
    
    assert_equal 1, dinner.plates.reload.size
    assert_equal 5, dinner.plates.map(&:weight).sum
  end
  
  test "doesn't allow to create plates with more than 10 total weight" do
    dinner = Dinner.create!
    
    plate1 = dinner.plates.create weight: 5
    plate2 = dinner.plates.create weight: 6 # should not be saved
    
    assert plate1.valid?
    refute dinner.valid?
    refute plate2.valid?
    
    assert_equal 1, dinner.plates.reload.size
  end
  
  test "doesn't allow to modify plates to" do
    dinner = Dinner.create!
    plate1 = dinner.plates.create weight: 5
    plate2 = dinner.plates.create weight: 5
    
    updated_plate2 = Plate.find(plate2.id)
    updated_plate2.weight = 6
    updated_plate2.save
    
    refute plate2.valid?
    refute dinner.valid? # should not be saved
  end
end
