require 'openproject_api/api'

module OpenprojectApi
	class Client < Api
		Dir[File.expand_path('client/*.rb', __dir__)].sort.each do |f|
			require f
		end
		
		include Projects
		include Relations
		include Root
		include Statuses
		include TimeEntries
		include Types
		include UserPreferences
		include Users
		include WorkPackages
	end
end
