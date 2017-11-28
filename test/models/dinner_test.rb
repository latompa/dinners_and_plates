require 'test_helper'

class DinnerTest < ActiveSupport::TestCase
  
  test "allows a dinner" do
    assert Dinner.create
  end
  
end
