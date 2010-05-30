# Extend Libvirt::Domain with different methods for human readable display of
# the domain state.
module Libvirt
	class Domain
		def to_s
			self.name
		end

		def state
			case( self.info.state )
				when 1
					">"
				when 3
					"||"
				else
					"?"
			end
		end

		def mem
			( self.info.memory / 1024 ).to_s + "M"
		end

		def mem_max
			( self.info.max_mem / 1024 ).to_s + "M"
		end

		def cpu_num
			self.info.nr_virt_cpu.to_s
		end

		def cpu_time
			self.info.cpu_time.to_s
		end
	end
end
