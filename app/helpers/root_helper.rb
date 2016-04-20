module RootHelper
  def get_feelings_last_days(days)
    data = Hash.new

    last_report_day = get_last_report_day
    data["days"] = get_day_names_for_week(last_report_day, days)
    data["data"] = get_feeling_last_seven_days_data(last_report_day, days)

    return data
  end

  def get_last_report_day
    return ReportInstance.last.report_datetime.to_date
  end

  def get_day_names_for_week(date, days_back)
    days = []
    days << date.strftime("%a")

    (1..(days_back - 1)).each do |n|
      day = date - n
      days << day.strftime("%a")
    end

    return days.reverse
  end

  def get_feeling_last_seven_days_data(date, days)
    data = Hash.new

    ReportInstance.where("report_datetime >= ?", date - days).each do |report|
      feeling = report.feeling.name

      if not data.key?(feeling)
        data[feeling] = Array.new(days) {|i| 0 }
      end

      day_index = report.report_datetime.to_date - date
      data[feeling][day_index] += 1
    end

    data.each do |key, value|
      data[key] = data[key].reverse
    end

    return data
  end
end
