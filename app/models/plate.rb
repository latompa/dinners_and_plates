class Plate < ApplicationRecord
  belongs_to :dinner
  validates_associated :dinner
end
