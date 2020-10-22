require_relative 'api'

module OpenprojectApi
	class Client < Api
		Dir[File.expand_path('client/*.rb', __dir__)].each do |f|
			require f
		end
		
		include Projects
		include Root
		include Statuses
		include TimeEntries
		include Types
		include UserPreferences
		include Users
		include WorkPackages
	end
end
