# frozen_string_literal: true

require_relative 'errors_exceptions/errors.rb'
require 'byebug'
class LogParser
  attr_reader :log_path

  def initialize(log_path)
    raise LogPathRequired if log_path.nil? || log_path.empty?
    raise LogPathInvalid unless File.exist?(log_path)
  end
end
