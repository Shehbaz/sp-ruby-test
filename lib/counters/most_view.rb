# frozen_string_literal: true

require_relative 'base'

module Counters
  class MostView < Base
    private

    def views_sorted
      @page_views.sort_by { |_path, ips| -ips.count }
    end

    def views_count(views)
      views.count
    end

    def view_detail
      'visits'
    end
  end
end
