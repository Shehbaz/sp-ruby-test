# frozen_string_literal: true

require_relative '../lib/console_printer'

describe ConsolePrinter do
  describe '#print_parsed' do
    subject { described_class.new(log_path).print_counts }
    context 'when log file has page views' do
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

      let(:expected_content) do
        <<~CONTENT
          /home 3 visits
          /about 1 visits
          /home 2 unique views
          /about 1 unique views
        CONTENT
      end

      it 'should print output on console' do
        expect { subject }.to output(expected_content).to_stdout
      end
    end
  end
end
