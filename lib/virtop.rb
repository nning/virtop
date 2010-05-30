$:.unshift( File.dirname( __FILE__ ) )

Dir.glob( $:.first + '/**/*.rb' ).each do |file|
	require( file )
end
