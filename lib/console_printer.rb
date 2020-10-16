# frozen_string_literal: true

require_relative 'page_views'
require 'byebug'

class ConsolePrinter
  def print_parsed(log_path)
    PageViews.new(log_path).counts.each do |line|
      puts line
    end
  end
end
