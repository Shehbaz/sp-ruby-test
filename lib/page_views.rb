# frozen_string_literal: true

require_relative 'decorators/most_view'
require_relative 'decorators/unique_view'

class PageViews
  def initialize(page_views)
    @page_views = page_views
  end

  def most_views
    Decorators::MostView.new(@page_views).count
  end

  def unique_views
    Decorators::UniqueView.new(@page_views).count
  end
end
