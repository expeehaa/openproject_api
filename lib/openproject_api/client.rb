require 'base64'
require 'api_frame'

require 'openproject_api/objectified_hash'

module OpenprojectApi
	class Client
		include ApiFrame::EndpointMethods
		
		attr_reader :base_uri
		
		def initialize(endpoint:, apikey:)
			@base_uri             = URI(endpoint)
			@authorization_header = "Basic #{Base64.strict_encode64("apikey:#{apikey}")}"
		end
		
		def default_headers
			{
				'Authorization' => @authorization_header,
			}
		end
		
		def default_response_parser
			proc do |response|
				OpenprojectApi::ObjectifiedHash.new(JSON.parse(response.body))
			end
		end
		
		define_endpoint :projects,                                    method: :get,    endpoint: proc {                               '/api/v3/projects'                                                       }
		define_endpoint :project,                                     method: :get,    endpoint: proc { |project_id                 | "/api/v3/projects/#{project_id}"                                         }
		define_endpoint :update_project,                              method: :patch,  endpoint: proc { |project_id                 | "/api/v3/projects/#{project_id}"                                         }
		define_endpoint :create_project,                              method: :get,    endpoint: proc {                               '/api/v3/projects'                                                       }
		define_endpoint :delete_project,                              method: :delete, endpoint: proc { |project_id                 | "/api/v3/projects/#{project_id}"                                         }
		define_endpoint :project_types,                               method: :get,    endpoint: proc { |project_id                 | "/api/v3/projects/#{project_id}/types"                                   }
		define_endpoint :project_available_parent_project_candidates, method: :get,    endpoint: proc {                               '/api/v3/projects/available_parent_projects'                             }
		
		define_endpoint :relations,                                   method: :get,    endpoint: proc {                               '/api/v3/relations'                                                      }
		define_endpoint :relation,                                    method: :get,    endpoint: proc { |relation_id                | "/api/v3/relations/#{relation_id}"                                       }
		define_endpoint :update_relation,                             method: :patch,  endpoint: proc { |relation_id                | "/api/v3/relations/#{relation_id}"                                       }
		define_endpoint :delete_relation,                             method: :delete, endpoint: proc { |relation_id                | "/api/v3/relations/#{relation_id}"                                       }
		
		define_endpoint :root,                                        method: :get,    endpoint: proc {                               '/api/v3'                                                                }
		
		define_endpoint :statuses,                                    method: :get,    endpoint: proc {                               '/api/v3/statuses'                                                       }
		define_endpoint :status,                                      method: :get,    endpoint: proc { |status_id                  | "/api/v3/statuses/#{status_id}"                                          }
		
		define_endpoint :time_entries,                                method: :get,    endpoint: proc {                               '/api/v3/time_entries'                                                   }
		define_endpoint :time_entry,                                  method: :get,    endpoint: proc { |time_entry_id              | "/api/v3/time_entries/#{time_entry_id}"                                  }
		define_endpoint :update_time_entry,                           method: :patch,  endpoint: proc { |time_entry_id              | "/api/v3/time_entries/#{time_entry_id}"                                  }
		define_endpoint :create_time_entry,                           method: :post,   endpoint: proc {                               '/api/v3/time_entries'                                                   }
		define_endpoint :delete_time_entry,                           method: :delete, endpoint: proc { |time_entry_id              | "/api/v3/time_entries/#{time_entry_id}"                                  }
		define_endpoint :time_entries_available_projects,             method: :get,    endpoint: proc {                               '/api/v3/time_entries/available_projects'                                }
		
		define_endpoint :types,                                       method: :get,    endpoint: proc {                               '/api/v3/types'                                                          }
		define_endpoint :type,                                        method: :get,    endpoint: proc { |type_id                    | "/api/v3/types/#{type_id}"                                               }
		
		define_endpoint :my_preferences,                              method: :get,    endpoint: proc {                               '/api/v3/my_preferences'                                                 }
		define_endpoint :update_my_preferences,                       method: :patch,  endpoint: proc {                               '/api/v3/my_preferences'                                                 }
		
		define_endpoint :users,                                       method: :get,    endpoint: proc {                               '/api/v3/users'                                                          }
		define_endpoint :user,                                        method: :get,    endpoint: proc { |user_id                    | "/api/v3/users/#{user_id}"                                               }
		define_endpoint :update_user,                                 method: :patch,  endpoint: proc { |user_id                    | "/api/v3/users/#{user_id}"                                               }
		define_endpoint :create_user,                                 method: :post,   endpoint: proc {                               '/api/v3/users'                                                          }
		define_endpoint :delete_user,                                 method: :delete, endpoint: proc { |user_id                    | "/api/v3/users/#{user_id}"                                               }
		define_endpoint :lock_user,                                   method: :post,   endpoint: proc { |user_id                    | "/api/v3/users/#{user_id}/lock"                                          }
		define_endpoint :unlock_user,                                 method: :delete, endpoint: proc { |user_id                    | "/api/v3/users/#{user_id}/lock"                                          }
		
		define_endpoint :work_packages,                               method: :get,    endpoint: proc {                               '/api/v3/work_packages'                                                  }
		define_endpoint :work_package,                                method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}"                               }
		define_endpoint :update_work_package,                         method: :patch,  endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}"                               }
		define_endpoint :create_work_package,                         method: :post,   endpoint: proc {                               '/api/v3/work_packages'                                                  }
		define_endpoint :delete_work_package,                         method: :delete, endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}"                               }
		define_endpoint :work_package_relations,                      method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/relations"                     }
		define_endpoint :add_work_package_relation,                   method: :post,   endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/relations"                     }
		define_endpoint :work_package_available_relation_candidates,  method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/available_relation_candidates" }
		define_endpoint :work_package_watchers,                       method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/watchers"                      }
		define_endpoint :add_work_package_watcher,                    method: :post,   endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/watchers"                      }
		define_endpoint :delete_work_package_watcher,                 method: :get,    endpoint: proc { |work_package_id, watcher_id| "/api/v3/work_packages/#{work_package_id}/watchers/#{watcher_id}"        }
		define_endpoint :work_package_available_watchers,             method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/available_watchers"            }
		define_endpoint :work_package_activities,                     method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/activities"                    }
		define_endpoint :add_work_package_activity,                   method: :post,   endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/activities"                    }
		define_endpoint :work_package_available_assignees,            method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/available_assignees"           }
		define_endpoint :work_package_available_responsibles,         method: :get,    endpoint: proc { |work_package_id            | "/api/v3/work_packages/#{work_package_id}/available_responsibles"        }
	end
end
