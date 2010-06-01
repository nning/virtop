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
			t = self.info.cpu_time / 10**7 / 60

			d = ( t / 100 / 60 / 24 ).to_s
			h = ( t / 100 / 60 % 24 ).to_s
			m = ( t / 100 % 60      ).to_s
			s = ( t % 100           ).to_s # TODO this value is not correct

			str  = d != '0' ? d + '-' : ''
			str += h != '0' ? "%02i:" % h : ''
			str += "%02i:" % m
			str += s

			str
		end
	end
end
