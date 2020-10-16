#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'lib/console_printer.rb'

ConsolePrinter.new(ARGV[0]).print_counts
