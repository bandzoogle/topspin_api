require "topspin_api/client"
require "topspin_api/pagination"
require "topspin_api/artist"
require "topspin_api/store"
require "topspin_api/version"
require "multi_json"

module TopspinApi

  class ClientError < StandardError; end
  class InternalError < StandardError; end

end