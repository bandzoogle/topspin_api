require 'httparty'

module TopspinStore

  class Client
    include HTTParty
    base_uri 'app.topspin.net'
    default_timeout 3

    def authenticate(email, api_key)
      @email = email
      @api_key = api_key
    end

    def initialize(artist_id)
      @artist_id = artist_id
    end

    def fetch_json(path, options = {})
      options[:basic_auth] = { :username => @email, :password => @api_key }
      response = self.class.get "/api/v2/store/#{path}", options
      puts response.inspect
      puts response.headers['status']
      case status = response.headers['status']
      when "200"
        return response.parsed_response
      when "401"
        msg = response["message"] rescue nil
        msg ||= "Unauthorized access"
        raise TopspinStore::ClientError.new "Topspin: #{msg} (#{status})"
      when "404"
        msg = response["message"] rescue nil
        msg ||= "Resource not found"
        raise TopspinStore::ClientError.new "Topspin: #{msg} (#{status})"
      else
        msg = response["message"] rescue nil
        msg ||= "Error"
        raise TopspinStore::InternalError.new "Topspin: #{msg} (#{status})"
      end
    end

    # Get a list of products from the store
    # options:
    #   :tag_name - defaults to "ts_all_products" which is a reserved name
    #   :page - defaults to 1
    def page(options = {})
      options[:tag_name] = "ts_all_products" unless options[:tag_name]
      options[:page] = 1 unless options[:page]
      fetch_json("#{@artist_id}/#{options[:tag_name]}/#{options[:page]}")
    end

    # Get detailed information about an offer
    # options:
    #   :offer_id - the offer ID (mandatory)
    def detail(options = {})
      raise TopspinStore::ClientError.new ":offer_id option is mandatory" unless options[:offer_id]
      fetch_json("detail/#{options[:offer_id]}")
    end

  end

end