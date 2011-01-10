# Extend Libvirt::Domain with different methods for human readable display of
# the domain state.
class Libvirt::Domain
  # Default string representation of domain object is the domain's name.
  def to_s
    self.name
  end

  # Return state as string symbol.
  def state
    case self.info.state
      when 1
        ">"
      when 3
        "||"
      else
        "?"
    end
  end

  # Return current memory assignment in mebibytes as string.
  def mem
    (self.info.memory / 1024).to_s + "M"
  end

  # Return maximum memory assignment in mebibytes as string.
  def mem_max
    (self.info.max_mem / 1024).to_s + "M"
  end

  # Return the number of assigned virtual CPUs as string.
  def cpu_num
    self.info.nr_virt_cpu.to_s
  end

  # Return time the virtual domain's CPU was scheduled as string formatted
  # d-hh:mm:ss.
  def cpu_time
    t = self.info.cpu_time / 10**9

    s = (t % 60                ).to_s
    m = (t / 60 % 60           ).to_s
    h = (t / 60 / 60 % 24      ).to_s
    d = (t / 60 / 60 / 24 % 365).to_s

    "%i-%02i:%02i:%02i" % [d, h, m, s]
  end
end
