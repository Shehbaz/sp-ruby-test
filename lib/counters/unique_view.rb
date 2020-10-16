# frozen_string_literal: true
# frozen_string_literal: true

require_relative 'base'

module Counters
  class UniqueView < Base
    private

    def views_sorted
      @page_views.sort_by { |_path, ips| -ips.uniq.count }
    end

    def views_count(views)
      views.uniq.count
    end

    def view_detail
      'unique views'
    end
  end
end
