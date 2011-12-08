require "topspin_store/version"
require "topspin_store/client"
require "topspin_store/store"
require "multi_json"

module TopspinStore

  def self.authenticate(email, api_key)
    Client.basic_auth email, api_key
  end

  class ClientError < StandardError; end
  class InternalError < StandardError; end

end