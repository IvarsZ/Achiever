class Achievment < ActiveRecord::Base
  has_one :goal
  has_one :stake
end
