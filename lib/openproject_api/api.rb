require 'uri'
require 'net/https'
require 'json'
require_relative 'objectified_hash'

module OpenprojectApi
	class Api
		attr_accessor :endpoint
		attr_accessor :apikey
		
		def initialize(endpoint:, apikey:)
			self.endpoint = endpoint
			self.apikey   = apikey
		end
		
		def request(resource, query: {}, &block)
			uri = URI.join(endpoint, resource)
			uri.query = URI.encode_www_form(query)
			
			response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme=='https') do |http|
				request = yield(uri)
				
				request.basic_auth('apikey', apikey)
				
				http.request(request)
			end
			
			if response.is_a?(Net::HTTPSuccess)
				ObjectifiedHash.new(JSON.parse(response.body))
			else
				response.error!
			end
		end
		
		def get(resource, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Get.new(uri.request_uri)
			end
		end
		
		def post(resource, body, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Post.new(uri.request_uri).tap do |request|
					request['Content-Type'] = 'application/json'
					request['Accept'      ] = 'application/json'
					request.body            = body.to_json
				end
			end
		end
		
		def patch(resource, body, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Patch.new(uri.request_uri).tap do |request|
					request['Content-Type'] = 'application/json'
					request['Accept'      ] = 'application/json'
					request.body            = body.to_json
				end
			end
		end
		
		def delete(resource, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Delete.new(uri.request_uri)
			end
		end
	end
end
