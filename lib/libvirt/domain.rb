# Extend Libvirt::Domain with different methods for human readable display of
# the domain state.
class Libvirt::Domain
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
		t = self.info.cpu_time / 10**9

		s = ( t % 60                 ).to_s
		m = ( t / 60 % 60            ).to_s
		h = ( t / 60 / 60 % 24       ).to_s
		d = ( t / 60 / 60 / 24 % 365 ).to_s

		"%i-%02i:%02i:%02i" % [d, h, m, s]
	end
end
