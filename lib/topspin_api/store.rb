module TopspinApi

  class Store
    include Client
    include Pagination

    attr_accessor :artist_id

    def initialize(artist_id)
      @artist_id = artist_id
      @prefix = "v2/store"
    end

    # Get an array of all the offers available at this artist's store.
    # It's a paginated list.
    def offers(options = {})
      options[:tag_name] = "ts_all_products" unless options[:tag_name]
      options[:page] = 1 unless options[:page]
      hash = fetch_json("#{@artist_id}/#{options[:tag_name]}/#{options[:page]}")
      decorate(hash, hash["offers"])
    end

    # Get detailed information about an offer
    def detail(offer_id)
      fetch_json("detail/#{offer_id}")
    end

    # Get a list of all the stores that available for the given credentials
    def self.list(email, api_key)
      artist = Artist.new
      artist.authenticate(email, api_key)
      artist.list.map do |hash|
        store = new(hash[:id])
        store.authenticate(email, api_key)
        store
      end
    end

  end

end