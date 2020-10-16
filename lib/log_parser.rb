# frozen_string_literal: true

require_relative 'errors_exceptions/errors'

class LogParser
  attr_reader :log_path

  def initialize(log_path)
    @log_path = log_path
    validate
    @parsed_lines = Hash.new { |h, k| h[k] = [] }
  end

  def parse
    parse_log
    @parsed_lines
  end

  private

  def parse_log
    File.open(log_path).each_line do |line|
      page, ip = line.split
      @parsed_lines[page] << ip
    end
  end

  def validate
    raise LogPathRequired if log_path.nil? || log_path.empty?
    raise LogPathInvalid unless File.exist?(log_path)
  end
end
