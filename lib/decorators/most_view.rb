# frozen_string_literal: true

require_relative 'base'

module Decorators
  class MostView < Base
    private

    def views_sorted
      @page_views.sort_by { |_path, ips| -ips.count }
    end

    def formatted_count
      views_sorted.map { |page, views| "#{page} #{views.count} visits" }
    end
  end
end
