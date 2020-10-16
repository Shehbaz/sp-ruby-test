#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'lib/log_parser.rb'
require_relative 'lib/page_views.rb'

page_views = LogParser.new('webserver.log').parse
# puts PageViews.new(page_views).most_views
puts PageViews.new(page_views).unique_views
