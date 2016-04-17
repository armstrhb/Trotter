class ReportInstance < ActiveRecord::Base
  has_and_belongs_to_many :people
  belongs_to :activity
  belongs_to :location
  belongs_to :feeling
  belongs_to :feeling_reason
  belongs_to :weather
  belongs_to :noise_level_description

  validates :report_datetime, presence: true
  validates :activity, presence: true
  validates :location, presence: true
  validates :feeling, presence: true
end
