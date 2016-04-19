class ReportDailyMorning < ActiveRecord::Base
  belongs_to :weather
  belongs_to :sleep_quality
  belongs_to :noise_level_description
end
