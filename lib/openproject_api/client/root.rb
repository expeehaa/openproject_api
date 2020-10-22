module OpenprojectApi
	class Client
		module Root
			def root(*args)
				get('/api/v3', *args)
			end
		end
	end
end
