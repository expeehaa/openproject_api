require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :update_manifest do
	File.write(File.expand_path('manifest', __dir__), Dir['lib/**/*', 'Gemfile', 'Gemfile.lock', 'openproject-api.gemspec', 'Rakefile', 'manifest'].join("\n"))
end
