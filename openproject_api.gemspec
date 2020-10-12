require_relative 'lib/openproject_api/version'

Gem::Specification.new do |spec|
	spec.name          = 'openproject_api'
	spec.version       = OpenprojectApi::VERSION
	spec.authors       = ['expeehaa']
	spec.email         = ['expeehaa@outlook.com']

	spec.summary       = %q{Ruby interface for the OpenProject API.}
	spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

	spec.metadata['allowed_push_host'] = 'https://rubygems.org'

	# Specify which files should be added to the gem when it is released.
	# The `git ls-files -z` loads the files in the RubyGem that have been added into git.
	spec.files         = File.read(File.expand_path('files.txt', __dir__)).split("\n")
	spec.bindir        = 'exe'
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ['lib']
end
