class LoadController < ApplicationController
  include LoadHelper

  def load
    puts "load>load invoked"
    @data_file = "config/reporter-export.csv"
    @num_rows_processed = load_data(@data_file)
  end
end
