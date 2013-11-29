module OCR
  LINES_PER_ACCOUNT = 4
  ACCOUNT_LINES_SIZE = 3

  def self.read_file(path, &account_parser)
    IO.foreach(path).each_slice(LINES_PER_ACCOUNT).take_while do |lines|
      account_parser.call(lines.take(ACCOUNT_LINES_SIZE))
    end
    account_parser.call(nil)
  end
end
