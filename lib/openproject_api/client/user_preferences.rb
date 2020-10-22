module OpenprojectApi
	class Client
		module UserPreferences
			def my_preferences(*args)
				get('/api/v3/my_preferences', *args)
			end
			
			def update_my_preferences(body, *args)
				patch('/api/v3/my_preferences', body, *args)
			end
		end
	end
end
