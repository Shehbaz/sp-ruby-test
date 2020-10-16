# frozen_string_literal: true
require 'byebug'

class PageViews
  def initialize(page_views)
    @page_views = page_views
  end

  def most_views
    formatted_most_views
  end

  def unique_views
    formatted_unique_views
  end

  private

  def most_views_sorted
    @page_views.sort_by { |_page, views| -views.count }
  end

  def unique_views_sorted
    @page_views.sort_by { |_page, views| -views.uniq.count }
  end

  def formatted_most_views
    most_views_sorted.map { |page, views| "#{page} #{views.count} visits" }
  end

  def formatted_unique_views
    unique_views_sorted.map { |page, views| "#{page} #{views.uniq.count} unique views" }
  end
end
