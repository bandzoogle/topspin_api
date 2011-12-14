module TopspinStoreApi

  class Store

    attr_accessor :client, :artist_id

    def initialize(artist_id)
      @artist_id = artist_id
      @client = Client.new(artist_id)
    end

    def authenticate(email, api_key)
      @client.authenticate(email, api_key)
    end

    # Get an array of all the offers available at this artist's store.
    # It's a paginated list.
    def offers(options = {})
      hash = @client.page(options)
      decorate(hash, hash["offers"])
    end

    def detail(offer_id)
      @client.detail :offer_id => offer_id
    end

    protected

      # Adds some methods to an array to represent the meta-data for pagination:
      # - total_pages
      # - current_page
      # - total_entries
      # - per_page
      #
      def decorate(hash, array)
        def array.metaclass
          class << self; self; end
        end
        metaclass = array.metaclass
        %w(total_pages current_page total_entries per_page).each do |m|
          array.metaclass.send(:define_method, m) do
            hash[m].to_i
          end
        end
        array
      end

  end

end