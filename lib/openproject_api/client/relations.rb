module OpenprojectApi
	class Client
		module Relations
			def relations(*args)
				get('/api/v3/relations', *args)
			end
			
			def relation(relation_id, *args)
				get("/api/v3/relations/#{relation_id}", *args)
			end
			
			def update_relation(relation_id, body, *args)
				patch("/api/v3/relations/#{relation_id}", body, *args)
			end
			
			def delete_relation(relation_id, *args)
				delete("/api/v3/relations/#{relation_id}", *args)
			end
		end
	end
end
