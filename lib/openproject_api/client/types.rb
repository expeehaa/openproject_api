module OpenprojectApi
	class Client
		module Types
			def types(*args)
				get('/api/v3/types', *args)
			end
			
			def type(type_id, *args)
				get("/api/v3/types/#{type_id}", *args)
			end
		end
	end
end
