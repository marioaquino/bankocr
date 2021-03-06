require_relative '../../lib/parser'

describe Parser do
  subject { described_class.read_characters(lines) }

  context 'when the text is a series of 1s' do
    let(:lines) do [
      '                           ',
      '  |  |  |  |  |  |  |  |  |',
      '  |  |  |  |  |  |  |  |  |'
    ]
    end
    it { should == '111111111' }
  end

  context 'when the text is a series of 2s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      ' _| _| _| _| _| _| _| _| _|',
      '|_ |_ |_ |_ |_ |_ |_ |_ |_ '
    ]
    end
    it { should == '222222222' }
  end

  context 'when the text is a series of 3s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      ' _| _| _| _| _| _| _| _| _|',
      ' _| _| _| _| _| _| _| _| _|'
    ]
    end
    it { should == '333333333' }
  end

  context 'when the text is a series of 4s' do
    let(:lines) do [
      '                           ',
      '|_||_||_||_||_||_||_||_||_|',
      '  |  |  |  |  |  |  |  |  |'
    ]
    end
    it { should == '444444444' }
  end

  context 'when the text is a series of 5s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      '|_ |_ |_ |_ |_ |_ |_ |_ |_ ',
      ' _| _| _| _| _| _| _| _| _|'
    ]
    end
    it { should == '555555555' }
  end

  context 'when the text is a series of 6s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      '|_ |_ |_ |_ |_ |_ |_ |_ |_ ',
      '|_||_||_||_||_||_||_||_||_|'
    ]
    end
    it { should == '666666666' }
  end

  context 'when the text is a series of 7s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      '  |  |  |  |  |  |  |  |  |',
      '  |  |  |  |  |  |  |  |  |'
    ]
    end
    it { should == '777777777' }
  end

  context 'when the text is a series of 8s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      '|_||_||_||_||_||_||_||_||_|',
      '|_||_||_||_||_||_||_||_||_|'
    ]
    end
    it { should == '888888888' }
  end

  context 'when the text is a series of 9s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      '|_||_||_||_||_||_||_||_||_|',
      ' _| _| _| _| _| _| _| _| _|'
    ]
    end
    it { should == '999999999' }
  end

  context 'when the text is a series of 0s' do
    let(:lines) do [
      ' _  _  _  _  _  _  _  _  _ ',
      '| || || || || || || || || |',
      '|_||_||_||_||_||_||_||_||_|'
    ]
    end
    it { should == '000000000' }
  end
end
