#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'lib/log_parser.rb'
require_relative 'lib/page_views.rb'

page_views = LogParser.new('webserver.log').parse
page_view = PageViews.new(page_views)
puts page_view.most_views
puts page_view.unique_views
