require 'topspin_store_api'

def fetch_json(name)
  MultiJson.decode(File.read("spec/fixtures/#{name}.json"))
end
