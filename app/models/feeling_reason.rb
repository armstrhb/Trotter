class FeelingReason < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
