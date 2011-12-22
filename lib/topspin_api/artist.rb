module TopspinApi

  class Artist
    include Client
    include Pagination

    attr_accessor :client

    def initialize()
      @prefix = 'v1/artist'
    end

    # Get an array of all the artists for these credentials.
    def list
      hash = fetch_json
      decorate(hash, hash["artists"].map {|artist|
        {
          :id => artist["id"],
          :name => artist["name"]
        }
      })
    end

  end

end