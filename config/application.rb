require_relative 'boot'

require 'rails/all'

require 'net/http'
require 'uri'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTest
  class Application < Rails::Application

    config.load_defaults 6.1

    def make_request

      # define number of requests to be made
      req_count = 5000
      # define request URI
      uri = 'https://gateway.quadpay.com/shopify/capture'

      (1..req_count).each do |i|
        x = Net::HTTP.post(URI.parse(uri), {}.to_json)
        puts x
      end
    end

    make_request
    
  end
end
