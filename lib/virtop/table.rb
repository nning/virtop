class Virtop::Table
	def initialize( *args )
		@header = args
		@rows = []
		@widths = [0] * args.size
	end

	def header
		@header.to_s + "\n"
	end

	def add_row( *args )
		raise( Exception ) if( args.size != @header.size )
		@rows.push( args )
	end

	def each_row
		@rows.each do |row|
			yield( row.to_s )
		end
	end

	def format
		update_widths!

		a = []

		( [ @header ] + @rows ).each do |row|
			line = ''
			@header.size.times do |i|
				line += row[i].ljust( @widths[i] + 2 )
			end
			a.push( line + "\n" )
		end

		a.insert( 1, "\n" )
	end

private

	def update_widths!
		@header.size.times do |i|
			( [ @header ] + @rows ).each do |row|
				@widths[i] = row[i].size if( @widths[i] < row[i].size)
			end
		end
	end
end
