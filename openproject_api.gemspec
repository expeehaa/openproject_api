require File.expand_path('lib/openproject_api/version', __dir__)

Gem::Specification.new do |spec|
	spec.name          = 'openproject_api'
	spec.version       = OpenprojectApi::VERSION
	spec.authors       = ['expeehaa']
	spec.email         = ['expeehaa@outlook.com']

	spec.summary       = %q{Ruby interface for the OpenProject API.}
	spec.homepage      = 'https://github.com/expeehaa/openproject_api'
	spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

	spec.metadata['allowed_push_host'] = 'https://rubygems.org'

	spec.files         = File.read(File.expand_path('manifest', __dir__)).split("\n")
	spec.bindir        = 'exe'
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ['lib']

	spec.add_development_dependency 'bundler', '~> 1.17'
	spec.add_development_dependency 'rake'   , '~> 13.0'
	spec.add_development_dependency 'rspec'  , '~> 3.0'
	spec.add_development_dependency 'pry'    , '~> 0.13'
end
