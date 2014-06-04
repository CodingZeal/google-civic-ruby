module Fixtures
  def self.load_fixture(kind)
    file_path = File.join(File.dirname(__FILE__), "../fixtures", "#{kind}.json")

    if File.exists?(file_path)
      File.open(file_path, "rb").read
    else
      raise "Fixture #{file_path} does not exist"
    end
  end

  def load_fixture(*args)
    Fixtures.load_fixture(*args)
  end
end