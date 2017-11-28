class Dinner < ApplicationRecord
  MAX_WEIGHT = 10
  
  has_many :plates
  validate :does_not_exceed_max_weight
  
  def does_not_exceed_max_weight
    if self.plates.map(&:weight).sum > MAX_WEIGHT
      errors.add(:base, "can't exceed #{MAX_WEIGHT}")
    end    
  end
end
