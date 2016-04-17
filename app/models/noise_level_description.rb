class NoiseLevelDescription < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
