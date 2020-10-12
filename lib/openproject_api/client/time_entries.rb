module OpenprojectApi
	class Client
		module TimeEntries
			def time_entries(*args)
				get('/api/v3/time_entries', *args)
			end
			
			def time_entry(time_entry_id, *args)
				get("/api/v3/time_entries/#{time_entry_id}", *args)
			end
			
			def patch_time_entry(time_entry_id, body, *args)
				patch("/api/v3/time_entries/#{time_entry_id}", body, *args)
			end
			
			def create_time_entry(body, *args)
				post('/api/v3/time_entries', body, *args)
			end
			
			def time_entries_available_projects(*args)
				get('/api/v3/time_entries/available_projects', *args)
			end
		end
	end
end
