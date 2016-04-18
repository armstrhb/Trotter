class LoadController < ApplicationController
  include LoadHelper

  def load
    puts "load>load invoked"
    @data_file = "config/reporter-export.csv"
    @num_rows_processed = load_data(@data_file)

    @num_people = Person.count
    @num_locations = Location.count
    @num_activities = Activity.count
    @num_feelings = Feeling.count
    @num_feeling_reasons = FeelingReason.count
    @num_noise_level_descriptions = NoiseLevelDescription.count
    @num_sleep_qualities = SleepQuality.count
    @num_weathers = Weather.count
  end
end
