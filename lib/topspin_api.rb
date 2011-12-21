require "topspin_api/version"
require "topspin_api/client"
require "topspin_api/store"
require "multi_json"

module TopspinApi

  class ClientError < StandardError; end
  class InternalError < StandardError; end

end