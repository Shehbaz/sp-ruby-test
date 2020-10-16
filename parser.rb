#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'lib/page_views.rb'

puts PageViews.new('webserver.log').counts
