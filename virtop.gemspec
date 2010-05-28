Gem::Specification.new do |s|
	s.name = 'virtop'

	s.summary = 'The top for virtual machines (libvirt).'
	s.description = 'virtop provides an overview of virtual machines runned with a solution abstracted by libvirt.'

	s.version = '0.0.1'
	s.date = '2010-05-28'
	s.author = 'henning mueller'
	s.email = 'henning@orgizm.net'

	s.files = [ 'bin/virtop' ]
	s.executables = [ 'virtop' ]

	s.add_dependency( 'ruby-libvirt', '>= 0.1.0' )
	s.add_dependency( 'elliottcable-ncurses', '>= 1.3.1' )
end
