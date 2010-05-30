# Extend Libvirt::Connect with a method which returns all available domains as
# an array.
module Libvirt
	class Connect
		def domains
			ret = Array.new

			self.list_domains.each do |id|
				ret.push( 
					self.lookup_domain_by_id( id )
				)
			end

			ret
		end
	end
end
