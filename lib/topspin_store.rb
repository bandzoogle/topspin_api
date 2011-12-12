require "topspin_store/version"
require "topspin_store/client"
require "topspin_store/store"
require "multi_json"

module TopspinStore

  class ClientError < StandardError; end
  class InternalError < StandardError; end

end