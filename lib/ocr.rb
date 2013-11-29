module OCR
  def self.read_file(path, &account_handler)
    account_handler.call(nil)
  end
end
