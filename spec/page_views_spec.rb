# frozen_string_literal: true

require_relative '../lib/page_views.rb'

describe PageViews do
  describe '#most_views' do
    subject { described_class.new(page_views).most_views }
    context 'when page views given' do
      let(:page_views) do
        {
          '/home' => %w[1.1.1.1 2.2.2.2 2.2.2.2],
          '/about' => %w[5.5.5.5],
          '/about/2' => %w[3.3.3.3 5.5.5.5],
          '/contact' => %w[4.4.4.4]
        }
      end

      let(:expected_sorted_count) do
        [
          '/home 3 visits',
          '/about/2 2 visits',
          '/about 1 visits',
          '/contact 1 visits'
        ]
      end

      it 'should return sorted most views with count' do
        expect(subject).to eq(expected_sorted_count)
      end
    end
  end

  describe '#unique_views' do
    subject { described_class.new(page_views).unique_views }
    context 'when page views given' do
      let(:page_views) do
        {
          '/home' => %w[1.1.1.1 2.2.2.2 2.2.2.2 2.2.2.2],
          '/about' => %w[5.5.5.5 1.1.1.1 2.2.2.2],
          '/about/2' => %w[3.3.3.3 5.5.5.5],
          '/contact' => %w[4.4.4.4]
        }
      end

      let(:expected_sorted_count) do
        [
          '/about 3 unique views',
          '/home 2 unique views',
          '/about/2 2 unique views',
          '/contact 1 unique views'
        ]
      end

      it 'should return sorted most views with count' do
        expect(subject).to eq(expected_sorted_count)
      end
    end
  end
end
