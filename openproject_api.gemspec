require_relative 'lib/openproject_api/version'

Gem::Specification.new do |spec|
	spec.name     = 'openproject_api'
	spec.version  = OpenprojectApi::VERSION
	spec.authors  = ['expeehaa']
	spec.email    = ['expeehaa@outlook.com']
	spec.license  = 'MIT'
	spec.summary  = 'Ruby interface for the OpenProject API.'
	spec.homepage = 'https://github.com/expeehaa/openproject_api'
	
	spec.required_ruby_version = '>= 2.6.0'
	
	spec.metadata['allowed_push_host'    ] = 'https://rubygems.org'
	spec.metadata['rubygems_mfa_required'] = 'true'
	
	spec.files         = Dir['lib/**/*.rb', 'README.adoc', 'LICENSE']
	spec.require_paths = ['lib']
	
	spec.add_dependency 'api_frame', '~> 0.1.1'
end
