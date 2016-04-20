class RootController < ApplicationController
  include RootHelper

  def index
    @num_reports = ReportInstance.count + ReportDailyMorning.count + ReportDailyNight.count
    @num_people = Person.count
    @num_locations = Location.count
    @num_activities = Activity.count
    @num_feelings = Feeling.count
    @num_weathers = Weather.count

    @feelings_last_seven_days_data = get_feelings_last_seven_days
  end
end
