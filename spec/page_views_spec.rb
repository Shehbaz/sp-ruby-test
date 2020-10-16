# frozen_string_literal: true

require_relative '../lib/page_views'

describe PageViews do
  describe '#counts' do
    subject { described_class.new(log_path).counts }
    context 'when log has page views' do
      let(:log_path) { sample_log.path }
      let(:sample_log) do
        Tempfile.new(['sample', '.log']).tap do |log|
          log.write(content)
          log.rewind
        end
      end

      let(:content) do
        <<~CONTENT
          /home 1.1.1.1
          /home 2.2.2.2
          /about 5.5.5.5
          /home 2.2.2.2
        CONTENT
      end

      let(:expected_sorted_count) do
        [
          '/home 3 visits',
          '/about 1 visits',
          '/home 2 unique views',
          '/about 1 unique views'
        ]
      end

      it 'should return sorted views with count' do
        expect(subject).to eq(expected_sorted_count)
      end
    end
  end
end
