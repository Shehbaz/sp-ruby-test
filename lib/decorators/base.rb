# frozen_string_literal: true

module Decorators
  class Base
    def initialize(page_views)
      @page_views = page_views
    end

    def count
      formatted_count
    end

    private

    def formatted_count
      views_sorted.map { |page, views| "#{page} #{views_count(views)} #{view_detail}" }
    end
  end
end
