require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :generate_files do
	File.write(File.expand_path('files.txt', __dir__), Dir['lib/**/*', 'Gemfile', 'Gemfile.lock', 'openproject-api.gemspec', 'Rakefile', 'files.txt'].join("\n"))
end
