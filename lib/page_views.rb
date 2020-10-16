# frozen_string_literal: true

require_relative 'counters/most_view'
require_relative 'counters/unique_view'

class PageViews
  def initialize(page_views)
    @page_views = page_views
  end

  def most_views
    Counters::MostView.new(@page_views).count
  end

  def unique_views
    Counters::UniqueView.new(@page_views).count
  end


end
