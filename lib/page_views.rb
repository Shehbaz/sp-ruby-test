# frozen_string_literal: true

require_relative 'counters/most_view'
require_relative 'counters/unique_view'
require_relative 'log_parser.rb'

class PageViews
  def initialize(log_file_path, parser = LogParser, counters = [Counters::MostView, Counters::UniqueView] )
    parsed_log = parser.new(log_file_path).parse
    @counters = counters.map { |counter| counter.new(parsed_log) }
  end

  def counts
    @counters.map(&:count).flatten
  end

end
