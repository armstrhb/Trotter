class ReportDailyNight < ActiveRecord::Base
  belongs_to :weather
  belongs_to :noise_level_description
  belongs_to :eat_quality
end
