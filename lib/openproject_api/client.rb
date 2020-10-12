require_relative 'api'

module OpenprojectApi
	class Client < Api
		Dir[File.expand_path('client/*.rb', __dir__)].each do |f|
			require f
		end
		
		include Projects
		include Statuses
		include TimeEntries
		include Types
		include WorkPackages
	end
end
