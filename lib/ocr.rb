require_relative 'parser'

module OCR
  LINES_PER_ACCOUNT = 4
  ACCOUNT_LINES_SIZE = 3

  def self.read_file(path, &account_parser)
    IO.foreach(path).each_slice(LINES_PER_ACCOUNT).take_while do |lines|
      account_parser.call(lines.take(ACCOUNT_LINES_SIZE).map(&delete_newline))
    end
    account_parser.call(nil)
  end

  def self.get_accounts(path)
    accounts = []
    read_file path do |lines|
      accounts << Parser.read_characters(lines) if lines
    end
    accounts
  end

  def self.delete_newline
    ->(str){ str.delete("\n") }
  end
end
