class Person < ActiveRecord::Base
  has_and_belongs_to_many :report_instances
end
