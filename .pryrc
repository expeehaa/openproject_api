require_relative 'lib/openproject_api'

pry_local_path = File.expand_path('.pryrc.local', __dir__)

if File.exist?(pry_local_path)
	Pry.toplevel_binding.eval(File.read(pry_local_path), pry_local_path)
end
