require_relative '../../lib/ocr'
require 'tempfile'

describe OCR do
  describe 'reading from a file' do
    subject {
      Tempfile.open('file.txt') do |f|
        populate_file.(f)
        f.close
        OCR.read_file(f.path, &account_parser)
      end
    }

    context 'when the file is empty' do
      let(:populate_file) { ->(file) {} }

      context 'calls the account number parser' do
        let(:account_parser) { -> (acct_number_or_nil) {raise 'Must be called'} }
        it do
          expect{subject}.to raise_error
        end
      end

      context 'yields a nil when the end of the file has been reached' do
        let(:account_parser) { -> (acct_number_or_nil) { acct_number_or_nil.should be_nil} }
        it { subject }
      end
    end

    context 'when the file is not empty' do
      let(:space) { ' ' }
      let(:line_ending) { "\n" }
      let(:line) { space + line_ending }
      let(:call_accumulator) { [] }
      let(:account_parser) { -> (lines) { call_accumulator << lines } }
      let(:populate_file) { ->(file) { file.write line * 8 } }

      before { subject }

      it 'passes lines in groups of 3 to the account number parser, leaving off the blank line' do
        call_accumulator.should == [[space, space, space], [space, space, space], nil]
      end
    end
  end

  describe 'getting account numbers' do
    let(:sample_path) { File.expand_path(File.join(__FILE__, '../../samples.txt')) }
    let(:parsed_account_numbers) { ['000000000', '111111111', '222222222',
                                    '333333333', '444444444', '555555555',
                                    '666666666', '777777777', '888888888',
                                    '999999999', '123456789'] }

    subject { described_class.get_accounts(sample_path)}

    it { should == parsed_account_numbers }
  end
end
