require_relative '../../lib/ocr'
require 'tempfile'

describe OCR do
  subject {
    Tempfile.open('file.txt') do |f|
      populate_file.(f)
      f.close
      OCR.read_file(f.path, &account_parser)
    end
  }

  context 'reading from an empty file' do
    let(:populate_file) { ->(file) {} }

    context 'calls the account number parser' do
      let(:account_parser) { -> (acct_number_or_nil) {raise 'Must be called'} }
      it 'blows up' do
        expect{subject}.to raise_error
      end
    end

    context 'yields a nil when the end of the file has been reached' do
      let(:account_parser) { -> (acct_number_or_nil) { acct_number_or_nil.should be_nil} }
      it { subject }
    end
  end

  context 'reading from a non-empty file' do
    let(:line) { "\n" }
    let(:call_accumulator) { [] }
    let(:account_parser) { -> (lines) { call_accumulator << lines } }
    let(:populate_file) { ->(file) { file.write line * 8 } }

    before { subject }

    it 'passes lines in groups of 3 to the account number parser, leaving off the blank line' do
      call_accumulator.should == [[line, line, line], [line, line, line], nil]
    end
  end
end
