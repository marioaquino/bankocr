require_relative '../../lib/parser'

describe Parser do
  subject { described_class.read_characters(lines) }

  context 'when the text is a series of 1s' do
    let(:lines) do [
      "                           ",
      "  |  |  |  |  |  |  |  |  |",
      "  |  |  |  |  |  |  |  |  |"
    ]
    end
    it { should == '111111111' }
  end

  context 'when the text is a series of 2s' do
    let(:lines) do [
      " _  _  _  _  _  _  _  _  _ ",
      " _| _| _| _| _| _| _| _| _|",
      "|_ |_ |_ |_ |_ |_ |_ |_ |_ "
    ]
    end
    it { should == '222222222' }
  end

  context 'when the text is a series of 3s' do
    let(:lines) do [
      " _  _  _  _  _  _  _  _  _ ",
      " _| _| _| _| _| _| _| _| _|",
      " _| _| _| _| _| _| _| _| _|"
    ]
    end
    it { should == '333333333' }
  end

  context 'when the text is a series of 4s' do
    let(:lines) do [
      "                           ",
      "|_||_||_||_||_||_||_||_||_|",
      "  |  |  |  |  |  |  |  |  |"
    ]
    end
    it { should == '444444444' }
  end
end
