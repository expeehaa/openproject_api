module OpenprojectApi
	class Client
		module Statuses
			def statuses(*args)
				get('/api/v3/statuses', *args)
			end
			
			def status(status_id, *args)
				get("/api/v3/statuses/#{status_id}", *args)
			end
		end
	end
end
