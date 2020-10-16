# frozen_string_literal: true

require_relative 'base'

module Decorators
  class MostView < Base
    def count
      views_formatted
    end

    private

    def views_sorted
      @page_views.sort_by { |_path, ips| -ips.count }
    end

    def views_formatted
      views_sorted.map { |page, views| "#{page} #{views.count} visits" }
    end
  end
end
