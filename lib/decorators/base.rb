# frozen_string_literal: true

module Decorators
  class Base
    def initialize(page_views)
      @page_views = page_views
    end

    def count
      formatted_count
    end
  end
end
