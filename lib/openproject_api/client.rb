require 'uri'
require 'net/https'
require 'json'

require 'openproject_api/objectified_hash'

module OpenprojectApi
	class Client
		attr_accessor :endpoint
		attr_accessor :apikey
		
		def initialize(endpoint:, apikey:)
			self.endpoint = endpoint
			self.apikey   = apikey
		end
		
		def request(resource, query: {})
			uri = URI.join(endpoint, resource)
			uri.query = URI.encode_www_form(query)
			
			response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
				request = yield(uri)
				
				request.basic_auth('apikey', apikey)
				
				http.request(request)
			end
			
			if response.is_a?(Net::HTTPSuccess)
				ObjectifiedHash.new(JSON.parse(response.body))
			else
				response.error!
			end
		end
		
		def get(resource, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Get.new(uri.request_uri)
			end
		end
		
		def post(resource, body, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Post.new(uri.request_uri).tap do |request|
					request['Content-Type'] = 'application/json'
					request['Accept'      ] = 'application/json'
					request.body            = body.to_json
				end
			end
		end
		
		def patch(resource, body, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Patch.new(uri.request_uri).tap do |request|
					request['Content-Type'] = 'application/json'
					request['Accept'      ] = 'application/json'
					request.body            = body.to_json
				end
			end
		end
		
		def delete(resource, *args)
			request(resource, *args) do |uri|
				Net::HTTP::Delete.new(uri.request_uri)
			end
		end
		
		
		def projects(*args)
			get('/api/v3/projects', *args)
		end
		
		def project(project_id, *args)
			get("/api/v3/projects/#{project_id}", *args)
		end
		
		def update_project(project_id, body, *args)
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
		
		
		def root(*args)
			get('/api/v3', *args)
		end
		
		
		def statuses(*args)
			get('/api/v3/statuses', *args)
		end
		
		def status(status_id, *args)
			get("/api/v3/statuses/#{status_id}", *args)
		end
		
		
		def time_entries(*args)
			get('/api/v3/time_entries', *args)
		end
		
		def time_entry(time_entry_id, *args)
			get("/api/v3/time_entries/#{time_entry_id}", *args)
		end
		
		def update_time_entry(time_entry_id, body, *args)
			patch("/api/v3/time_entries/#{time_entry_id}", body, *args)
		end
		
		def create_time_entry(body, *args)
			post('/api/v3/time_entries', body, *args)
		end
		
		def delete_time_entry(time_entry_id, *args)
			delete("/api/v3/time_entries/#{time_entry_id}", *args)
		end
		
		def time_entries_available_projects(*args)
			get('/api/v3/time_entries/available_projects', *args)
		end
		
		
		def types(*args)
			get('/api/v3/types', *args)
		end
		
		def type(type_id, *args)
			get("/api/v3/types/#{type_id}", *args)
		end
		
		
		def my_preferences(*args)
			get('/api/v3/my_preferences', *args)
		end
		
		def update_my_preferences(body, *args)
			patch('/api/v3/my_preferences', body, *args)
		end
		
		
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
		
		
		def work_packages(*args)
			get('/api/v3/work_packages', *args)
		end
		
		def work_package(work_package_id, *args)
			get("/api/v3/work_packages/#{work_package_id}", *args)
		end
		
		def update_work_package(work_package_id, body, *args)
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
