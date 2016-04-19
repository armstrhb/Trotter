class LoadController < ApplicationController
  include LoadHelper

  def load
    puts "load>load invoked"
    @data_file = "config/reporter-export.csv"
    @num_rows_processed = load_data(@data_file)

    @num_reports = ReportInstance.count + ReportDailyMorning.count + ReportDailyNight.count
    @num_people = Person.count
    @num_locations = Location.count
    @num_activities = Activity.count
    @num_feelings = Feeling.count
    @num_feeling_reasons = FeelingReason.count
    @num_noise_level_descriptions = NoiseLevelDescription.count
    @num_sleep_qualities = SleepQuality.count
    @num_weathers = Weather.count
  end

  def reset
    puts "load>reset invoked, resetting data"

    Activity.delete_all
    EatQuality.delete_all
    FeelingReason.delete_all
    Feeling.delete_all
    Location.delete_all
    NoiseLevelDescription.delete_all
    Person.delete_all
    ReportDailyMorning.delete_all
    ReportDailyNight.delete_all
    ReportInstance.delete_all
    SleepQuality.delete_all
    Weather.delete_all
  end
end
