module OpenprojectApi
	class Client
		module WorkPackages
			def work_packages(*args)
				get('/api/v3/work_packages', *args)
			end
			
			def work_package(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}", *args)
			end
			
			def patch_work_package(work_package_id, body, *args)
				patch("/api/v3/work_packages/#{work_package_id}", body, *args)
			end
			
			def create_work_package(body, *args)
				post('/api/v3/work_packages', body, *args)
			end
			
			def delete_work_package(work_package_id, *args)
				delete("/api/v3/work_packages/#{work_package_id}", *args)
			end
			
			def work_package_relations(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/relations", *args)
			end
			
			def add_work_package_relation(work_package_id, body, *args)
				post("/api/v3/work_packages/#{work_package_id}/relations", body, *args)
			end
			
			def work_package_available_relation_candidates(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/available_relation_candidates", *args)
			end
			
			def work_package_watchers(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/watchers", *args)
			end
			
			def add_work_package_watcher(work_package_id, body, *args)
				post("/api/v3/work_packages/#{work_package_id}/watchers", body, *args)
			end
			
			def delete_work_package_watcher(work_package_id, watcher_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/watchers/#{watcher_id}", *args)
			end
			
			def work_package_available_watchers(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/available_watchers", *args)
			end
			
			def work_package_activities(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/activities", *args)
			end
			
			def add_work_package_activity(work_package_id, body, *args)
				post("/api/v3/work_packages/#{work_package_id}/activities", body, *args)
			end
			
			def work_package_available_assignees(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/available_assignees", *args)
			end
			
			def work_package_available_responsibles(work_package_id, *args)
				get("/api/v3/work_packages/#{work_package_id}/available_responsibles", *args)
			end
		end
	end
end
