module OpenprojectApi
	class Client
		attr_accessor :endpoint
		attr_accessor :apikey
		
		def initialize(endpoint:, apikey:)
			self.endpoint = endpoint
			self.apikey   = apikey
		end
	end
end
