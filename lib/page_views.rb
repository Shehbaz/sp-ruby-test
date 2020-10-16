# frozen_string_literal: true

class PageViews
  def initialize(page_views)
    @page_views = page_views
  end

  def most_views
    formatted_views
  end

  private

  def most_views_sorted
    @page_views.sort_by { |_page, views| -views.count }
  end

  def formatted_views
    most_views_sorted.map { |page, views| "#{page} #{views.count} visits" }
  end
end
