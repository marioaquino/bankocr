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
end
