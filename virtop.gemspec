Gem::Specification.new do |s|
	s.name = 'virtop'

	s.summary = 'The top for virtual machines (libvirt).'
	s.description = 'virtop provides an overview of virtual machines runned with a solution abstracted by libvirt.'

	s.version = '0.0.5'
	s.author = 'henning mueller'
	s.email = 'henning@orgizm.net'

	s.files = Dir.glob( '{bin,lib}/**/*' ) << 'README'
	s.executables = Dir.glob( 'bin/**' ).map { |x| x[4..-1] }

	s.add_dependency( 'ruby-libvirt', '>= 0.1.0' )
#	s.add_dependency( 'elliottcable-ncurses', '>= 1.3.1' )
end
