require 'httparty'

module TopspinApi

  module Client

    def self.included(base)
      base.send :include, HTTParty
    end

    def authenticate(email, api_key)
      @email = email
      @api_key = api_key
    end

    def fetch_json(path = nil, options = {})
      options[:basic_auth] = { :username => @email, :password => @api_key }
      response = self.class.get "http://app.topspin.net/api/#{@prefix}/#{path}", options
      case status = response.headers['status']
      when "200", "200 OK"
        JSON.parse response.body
      when "401"
        msg = response["message"] rescue nil
        msg ||= "Unauthorized access"
        raise TopspinApi::ClientError.new "Topspin: #{msg} (#{status})"
      when "404"
        msg = response["message"] rescue nil
        msg ||= "Resource not found"
        raise TopspinApi::ClientError.new "Topspin: #{msg} (#{status})"
      else
        msg = response["message"] rescue nil
        msg ||= "Error"
        raise TopspinApi::InternalError.new "Topspin: #{msg} (#{status})"
      end
    end

  end

end
