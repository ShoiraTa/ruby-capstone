require 'json'

module JSONStorage
  def self.load(name)
    path = "./json/#{name}.json"
    return nil unless File.exist?(path)

    JSON.parse(File.read(path))
  end

  def self.save(name, data)
    Dir.mkdir('json') unless Dir.exist?('json')
    path = "./json/#{name}.json"
    File.write(path, JSON.generate(data))
  end
end