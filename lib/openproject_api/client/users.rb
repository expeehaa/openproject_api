module OpenprojectApi
	class Client
		module Users
			def users(*args)
				get('/api/v3/users', *args)
			end
			
			def user(user_id, *args)
				get("/api/v3/users/#{user_id}", *args)
			end
			
			def update_user(user_id, body, *args)
				patch("/api/v3/users/#{user_id}", body, *args)
			end
			
			def create_user(body, *args)
				post('/api/v3/users', body, *args)
			end
			
			def delete_user(user_id, *args)
				delete("/api/v3/users/#{user_id}", *args)
			end
			
			def lock_user(user_id, *args)
				post("/api/v3/users/#{user_id}/lock", *args)
			end
			
			def unlock_user(user_id, *args)
				delete("/api/v3/users/#{user_id}/lock", *args)
			end
		end
	end
end
