module LoadHelper
  require 'csv'
  @@weathers = []
  @@feelings = []
  @@feeling_reasons = []
  @@activities = []
  @@eat_qualities = []
  @@locations = []
  @@noise_level_descriptions = []
  @@people = []
  @@sleep_qualities = []

  def load_data(data_file)
    ActiveRecord::Base.logger.level = 1

    build_option_bank
    num_rows_processed = 0

    CSV.foreach(data_file, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
      if row.length == 1
        continue
      else
        process_row(row)
        num_rows_processed += 1
      end
    end

    ActiveRecord::Base.logger.level = 0

    return num_rows_processed
  end

  def build_option_bank
    @@weathers = Weather.all
    @@feelings = Feeling.all
    @@feeling_reasons = FeelingReason.all
    @@activities = Activity.all
    @@eat_qualities = EatQuality.all
    @@locations = Location.all
    @@noise_level_descriptions = NoiseLevelDescription.all
    @@people = Person.all
    @@sleep_qualities = SleepQuality.all
  end

  def process_row(row)
    if is_checkin(row)
      process_checkin(row)
    elsif is_morning_checkin(row)
      process_morning_checkin(row)
    elsif is_nightly_checkin(row)
      process_nightly_checkin(row)
    end
  end

  def process_checkin(row)
    report = ReportInstance.new
    report = get_root_metrics(report, row)

    report.is_working = get_is_working(row)
    report.people = get_people(row)
    report.activity = get_activity(row)
    report.location = get_location(row)
    report.feeling = get_feeling(row)
    report.feeling_reason = get_feeling_reason(row)
  end

  def process_morning_checkin(row)
    report = ReportDailyMorning.new
    #report = get_root_metrics(report, row)
  end

  def process_nightly_checkin(row)
    report = ReportDailyNight.new
    #report = get_root_metrics(report, row)
  end

  def get_root_metrics(report, row)
    report.report_datetime = get_checkin_timestamp(row)
    report.latitude = row["latitude"].to_f
    report.longitude = row["longitude"].to_f
    report.weather = get_weather(row)
    report.number_photos_added = row["Number of Photos Added"].to_i
    report.noise_level = row["Ambient Audio (dB)"]
    report.noise_level_description = get_noise_level_description(row)
    report.number_steps_taken = row["Number of Steps"].to_i

    return report
  end

  def get_feeling(row)
    feeling_name = row["How are you feeling?"]

    if feeling_name == nil
      return nil
    end

    feeling = @@feelings.where(name: feeling_name)

    if feeling.length > 0
      return feeling.first
    else
      puts "creating new feeling '#{feeling_name}'"
      feeling = Feeling.new(name: feeling_name)
      feeling.save

      @@feelings << feeling

      return feeling
    end
  end

  def get_feeling_reason(row)
    feeling_reason_name = row["Why do you feel that way?"]

    if feeling_reason_name == nil
      return nil
    end

    feeling_reason = @@feeling_reasons.where(name: feeling_reason_name)

    if feeling_reason.length > 0
      return feeling_reason.first
    else
      puts "creating new feeling reason '#{feeling_reason_name}'"
      feeling_reason = FeelingReason.new(name: feeling_reason_name)
      feeling_reason.save

      @@feeling_reasons << feeling_reason

      return feeling_reason
    end
  end

  def get_location(row)
    location_name = row["Where are you?"]

    if location_name == nil
      return nil
    end

    location = @@locations.where(name: location_name)

    if location.length > 0
      return location.first
    else
      puts "creating new location '#{location_name}'"
      location = Location.new(name: location_name)
      location.save

      @@locations << location

      return location
    end
  end

  def get_activity(row)
    activity_name = row["What are you doing?"]

    if activity_name == nil
      return nil
    end

    activity = @@activities.where(name: activity_name)

    if activity.length > 0
      return activity.first
    else
      puts "creating new activity '#{activity_name}'"
      activity = Activity.new(name: activity_name)
      activity.save

      @@activities << activity

      return activity
    end
  end

  def get_people(row)
    field_entry = row["Who are you with?"]
    people = []

    if field_entry == "No one"
      return people
    end

    field_entry.split(",").each do |person_entry|
      first_name, last_name = person_entry.split(" ")
      if last_name == nil
        person = @@people.where(nick_name: first_name)
        if person.length > 0
          people << person.first
        else
          puts "creating new person '#{first_name}'"
          person = Person.new(nick_name: first_name)
          person.save

          @@people << person
          people << person
        end
      else
        person = @@people.where(first_name: first_name, last_name: last_name)
        if person.length > 0
          people << person.first
        else
          puts "creating new person '#{first_name} #{last_name}'"
          person = Person.new(first_name: first_name, last_name: last_name)
          person.save

          @@people << person
          people << person
        end
      end
    end

    return people
  end

  def get_is_working(row)
    if row["Are you working?"] == "Yes"
      return true
    else
      return false
    end
  end

  def get_checkin_timestamp(row)
    return DateTime.strptime(row["Timestamp of Report (Local Time)"], "%B %e, %Y %H:%M:%S%P")
  end

  def get_noise_level_description(row)
    noise_level_desc = row["Ambient Audio Description"]

    if noise_level_desc == nil || noise_level_desc.length == 0
      return nil
    end

    noise_level_description = NoiseLevelDescription.where(name: noise_level_desc)

    if noise_level_description.length > 0
      return noise_level_description.first
    else
      puts "creating new noise level description '#{noise_level_desc}'"
      noise_level_description = NoiseLevelDescription.new(name: noise_level_desc)
      noise_level_description.save

      return noise_level_description
    end
  end

  def get_weather(row)
    weather_desc = row["Weather"]

    if weather_desc == nil || weather_desc.length == 0
      return nil
    end

    weather = @@weathers.where(name: weather_desc)

    if weather.length > 0
      return weather.first
    else
      puts "creating new weather entry '#{weather_desc}'"
      weather = Weather.new(name: weather_desc)
      weather.save

      @@weathers << weather

      return weather
    end
  end

  def is_checkin(row)
    return is_field_present(row, "What are you doing?")
  end

  def is_morning_checkin(row)
    return is_field_present(row, "How did you sleep?")
  end

  def is_nightly_checkin(row)
    return is_field_present(row, "How did you eat?")
  end

  def is_field_present(row, field)
    return row[field] != nil && row[field].length > 0
  end
end
