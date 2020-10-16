# frozen_string_literal: true

require_relative '../lib/log_parser.rb'
require 'tempfile'

describe LogParser do
  subject { described_class.new(log_path).parse }

  context 'when invalid log path' do
    context 'when empty path' do
      let(:log_path) { '' }

      it 'should raise invalid path error' do
        expect { subject }.to raise_error(LogPathRequired)
      end
    end

    context 'when nil path' do
      let(:log_path) { nil }

      it 'should raise invalid path error' do
        expect { subject }.to raise_error(LogPathRequired)
      end
    end

    context 'when no file on path exists' do
      let(:log_path) { 'abcd/def.log' }

      it 'should raise invalid path error' do
        expect { subject }.to raise_error(LogPathInvalid)
      end
    end
  end
  context 'when valid log provided' do
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
        /about/2 3.3.3.3
        /contact 4.4.4.4
        /about 5.5.5.5
        /about/2 5.5.5.5
        /home 2.2.2.2
      CONTENT
    end

    let(:parsed_lines) do
      {
        '/home' => %w[1.1.1.1 2.2.2.2 2.2.2.2],
        '/about' => %w[5.5.5.5],
        '/about/2' => %w[3.3.3.3 5.5.5.5],
        '/contact' => %w[4.4.4.4]
      }
    end

    it 'should parse all lines' do
      expect(subject).to eq(parsed_lines)
    end
  end
end
