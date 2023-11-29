require 'json'

class FileHandler
  def self.load_or_create(file_path)
    if File.exist?(file_path)
      File.open(file_path, 'r') { |file| JSON.parse(file.read) }
    else
      File.open(file_path, 'w') { |file| file.puts '[]' }
      []
    end
  end

  def self.save(file_path, data)
    File.open(file_path, 'w') { |file| file.puts JSON.dump(data) }
  end
end
