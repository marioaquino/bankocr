require_relative '../../lib/ocr'
require 'tempfile'

describe OCR do
  context 'reading from an empty file' do
    subject {
      Tempfile.open('empty.txt') do |f|
        OCR.read_file(f.path, &account_handler)
      end
    }

    context 'calls the account number handler' do
      let(:account_handler) { -> (acct_number_or_nil) {raise 'Must be called'} }
      it 'blows up' do
        expect{subject}.to raise_error
      end
    end

    context 'yields a nil when the end of the file has been reached' do
      let(:account_handler) { -> (acct_number_or_nil) { acct_number_or_nil.should be_nil} }
      it { subject }
    end
  end

  context 'reading from a non-empty file'
end
