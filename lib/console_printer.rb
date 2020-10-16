# frozen_string_literal: true

require_relative 'page_views'

class ConsolePrinter
  def initialize(log_path)
    @log_path = log_path
  end

  def print_counts
    PageViews.new(@log_path).counts.each do |line|
      puts line
    end
  end
end
