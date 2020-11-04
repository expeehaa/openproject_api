require_relative 'lib/openproject_api.rb'

pry_local_path = File.expand_path('.pryrc.local', __dir__)

if File.exists?(pry_local_path)
	Pry.toplevel_binding.eval(File.read(pry_local_path), pry_local_path)
end
