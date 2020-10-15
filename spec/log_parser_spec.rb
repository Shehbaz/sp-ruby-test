# frozen_string_literal: true

require_relative '../lib/log_parser.rb'

describe LogParser do
  subject { described_class.new(file_path) }

  context 'when empty path' do
    let(:file_path) { '' }

    it 'should raise invalid path error' do
      expect { subject }.to raise_error(LogPathRequired)
    end
  end

  context 'when nil path' do
    let(:file_path) { nil }

    it 'should raise invalid path error' do
      expect { subject }.to raise_error(LogPathRequired)
    end
  end

  context 'when invalid path' do
    let(:file_path) { 'abcd/def.log' }

    it 'should raise invalid path error' do
      expect { subject }.to raise_error(LogPathInvalid)
    end
  end
end
