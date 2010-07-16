# Extend Libvirt::Connect with a method which returns all available domains as
# an array and several methods to access the host info more easily.
class Libvirt::Connect
	# Returns array of domain objects.
	def domains
		ret = Array.new

		self.list_domains.each do |id|
			ret.push( 
				self.lookup_domain_by_id( id )
			)
		end

		ret
	end

	# Returns number of cores as string.
	def cores
		self.node_get_info.cores.to_s
	end

	# Returns number of CPUs as string.
	def cpus
		self.node_get_info.cpus.to_s
	end

	# Returns clock speed in GHz.
	def ghz
		"%.2f" % ( self.node_get_info.mhz / 1000.0 )
	end

	# Returns CPU architecture.
	def arch
		self.node_get_info.model
	end

	# Returns total memory in mebibytes as string.
	def mem
		( self.node_get_info.memory / 1024 ).to_s + 'M'
	end

	# Returns memory which is not allocated to virtual machines in mebibytes as
	# string.
	def memfree
		memUsed = 0

		self.domains.each do |domain|
			memUsed += domain.info.memory
		end

		( ( self.node_get_info.memory - memUsed ) / 1024 ).to_s + 'M'
	end

	# Returns the libvirt version number.
	def version
		self.libversion.to_s
	end
end
