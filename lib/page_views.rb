# frozen_string_literal: true

require_relative 'counters/most_view'
require_relative 'counters/unique_view'
require_relative 'log_parser'

class PageViews
  def initialize(log_path, counters = [Counters::MostView, Counters::UniqueView])
    parsed_log = LogParser.new(log_path).parse
    @counters = counters.map { |counter| counter.new(parsed_log) }
  end

  def counts
    @counters.map(&:count).flatten
  end
end
