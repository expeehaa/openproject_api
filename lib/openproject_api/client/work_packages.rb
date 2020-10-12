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
		end
	end
end
