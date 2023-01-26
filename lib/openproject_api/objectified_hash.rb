module OpenprojectApi
	# Slightly modified version from https://github.com/NARKOZ/gitlab/blob/3dd41722670570069693cc9b84c73f475d95e6be/lib/gitlab/objectified_hash.rb
	class ObjectifiedHash
		def initialize(hash)
			if hash.is_a?(Hash)
				@hash = hash
				@data = hash.each_with_object({}) do |(key, value), data|
					data[key.to_s] =
						case value
							when Hash
								self.class.new(value)
							when Array
								value.map do |element|
									if element.is_a?(Hash)
										self.class.new(element)
									else
										element
									end
								end
							else
								value
						end
				end
			else
				raise ArgumentError, "Expected Hash, got #{hash.inspect}."
			end
		end
		
		def to_hash
			@hash
		end
		alias to_h to_hash
		
		def inspect
			"#<#{self.class}:#{object_id} {hash: #{@hash.inspect}}>"
		end
		
		def [](key)
			@data[key]
		end
		
		private
		
		def method_missing(method_name, *args, &block)
			if @data.key?(method_name.to_s)
				@data[method_name.to_s]
			elsif @data.respond_to?(method_name)
				@data.send(method_name, *args, &block)
			else
				super
			end
		end
		
		def respond_to_missing?(method_name, include_private=false)
			@hash.keys.map(&:to_sym).include?(method_name) || @data.respond_to?(method_name) || super
		end
	end
end
