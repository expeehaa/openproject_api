module OpenprojectApi
	class Client
		module Projects
			def projects(*args)
				get('/api/v3/projects', *args)
			end
			
			def project(project_id, *args)
				get("/api/v3/projects/#{project_id}", *args)
			end
			
			def patch_project(project_id, body, *args)
				patch("/api/v3/projects/#{project_id}", body, *args)
			end
			
			def create_project(body, *args)
				get('/api/v3/projects', body, *args)
			end
			
			def delete_project(project_id, *args)
				delete("/api/v3/projects/#{project_id}", *args)
			end
			
			def project_types(project_id, *args)
				get("/api/v3/projects/#{project_id}/types", *args)
			end
			
			def project_available_parent_project_candidates(*args)
				get('/api/v3/projects/available_parent_projects', *args)
			end
		end
	end
end
