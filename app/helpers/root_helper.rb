module RootHelper
  def get_feelings_last_seven_days
    data = Hash.new

    last_report_day = get_last_report_day
    data["days"] = get_day_names_for_week(last_report_day)
    data["data"] = get_feeling_last_seven_days_data(last_report_day)
    puts "data: #{data["data"]}"
    return data
  end

  def get_last_report_day
    return ReportInstance.last.report_datetime.to_date
  end

  def get_day_names_for_week(date)
    days = []
    days << date.strftime("%a")

    (1..6).each do |n|
      day = date - n
      days << day.strftime("%a")
    end

    return days.reverse
  end

  def get_feeling_last_seven_days_data(date)
    data = Hash.new

    ReportInstance.where("report_datetime >= ?", date - 7).each do |report|
      feeling = report.feeling.name

      if not data.key?(feeling)
        data[feeling] = [0, 0, 0, 0, 0, 0, 0]
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
