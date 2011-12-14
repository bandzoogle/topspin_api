require "topspin_store_api/version"
require "topspin_store_api/client"
require "topspin_store_api/store"
require "multi_json"

module TopspinStoreApi

  class ClientError < StandardError; end
  class InternalError < StandardError; end

end