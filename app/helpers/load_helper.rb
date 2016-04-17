module LoadHelper
  require 'csv'

  def load_data(data_file)
    num_rows_processed = 0

    CSV.foreach(data_file, quote_char: '"', col_sep: ',', row_sep: :auto, headers: true) do |row|
      if row.length == 1
        continue
      else
        process_row(row)
        num_rows_processed += 1
      end
    end

    return num_rows_processed
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
    puts "#{get_checkin_timestamp(row)}"
  end

  def process_morning_checkin(row)

  end

  def process_nightly_checkin(row)

  end

  def get_checkin_timestamp(row)
    return DateTime.strptime(row["Timestamp of Report (Local Time)"], "%m/%d/%Y %H:%M:%S")
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
