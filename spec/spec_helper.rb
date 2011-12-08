require 'topspin_store'

def fetch_json(name)
  MultiJson.decode(File.read("spec/fixtures/#{name}.json"))
end
