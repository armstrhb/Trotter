Dashing.scheduler.every '30s', first_in: 1.second.since do
  puts "updating last week info"

  Dashing.send_event('peoplecount', current: Person.count )
  Dashing.send_event('locationcount', current: Location.count )
  Dashing.send_event('checkincount', current: ReportInstance.where("report_datetime > :date", date: 1.week.ago).count )
end
