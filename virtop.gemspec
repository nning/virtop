$:.unshift File.dirname(__FILE__)

require 'lib/virtop'

Gem::Specification.new do |s|
  s.name = 'virtop'

  s.summary = 'The top for virtual machines (libvirt).'
  s.description = 'virtop provides an overview of virtual machines runned with a solution abstracted by libvirt.'

  s.version = Virtop::VERSION
  s.author = 'henning mueller'
  s.email = 'henning@orgizm.net'

  s.files = Dir.glob('{bin,lib}/**/*') + Dir.glob('man/*.gz') + %w(README.md LICENSE)
  s.executables = Dir.glob('bin/**').map { |x| x[4..-1] }

  s.add_dependency 'ncursesw', '>= 1.2.4.2'
  s.add_dependency 'ruby-libvirt', '>= 0.3.0'
end
