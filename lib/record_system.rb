module RecordSystem
  def file_source
    File.expand_path("../data/records.csv", File.dirname(__FILE__))
  end
end