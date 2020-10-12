require_relative 'lib/openproject_api/version'

Gem::Specification.new do |spec|
	spec.name          = 'openproject_api'
	spec.version       = OpenprojectApi::VERSION
	spec.authors       = ['expeehaa']
	spec.email         = ['expeehaa@outlook.com']

	spec.summary       = %q{Ruby interface for the OpenProject API.}
	spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

	spec.metadata['allowed_push_host'] = 'https://rubygems.org'

	spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
		`hg files -0`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
	end
	spec.bindir        = 'exe'
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ['lib']
end
