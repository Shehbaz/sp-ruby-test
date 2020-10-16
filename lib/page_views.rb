# frozen_string_literal: true

require_relative 'decorators/most_view'
require 'byebug'

class PageViews
  def initialize(page_views)
    @page_views = page_views
  end

  def most_views
    Decorators::MostView.new(@page_views).count
  end

  def unique_views
    formatted_unique_views
  end

  private

  def unique_views_sorted
    @page_views.sort_by { |_page, views| -views.uniq.count }
  end

  def formatted_unique_views
    unique_views_sorted.map { |page, views| "#{page} #{views.uniq.count} unique views" }
  end
end
