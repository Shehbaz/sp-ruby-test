# frozen_string_literal: true
# frozen_string_literal: true

require_relative 'base'

module Decorators
  class UniqueView < Base

    private

    def views_sorted
      @page_views.sort_by { |_path, ips| -ips.uniq.count }
    end

    def formatted_count
      views_sorted.map { |page, views| "#{page} #{views.uniq.count} unique views" }
    end
  end
end
