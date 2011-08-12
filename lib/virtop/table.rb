# Represents a table. Important for column width correction and sorting of rows.
class Virtop::Table
  # Contructor gets table header strings as arguments.
  def initialize(*args)
    @header = args
    @rows = []
    @widths = [0] * args.size
  end

  # Adds a row to the table. Number of arguments must equal the number of
  # columns given by header strings on contruction.
  def add_row(*args)
    if args.size != @header.size
      raise Exception.new 'Wrong column number.'
    end

    @rows.push args
  end

  # Sorts the table by a certain column given by it's header string or the
  # index of the column starting at zero.
  def sort_by(col)
    if col.class == String
      index = @header.index col
    else
      index = col.to_i
    end

    @rows = @rows.sort_by do |row|
      if block_given?
        yield row[index]
      else
        row[index]
      end
    end
  end

  # Converts the whole table as array of strings, which are fancy formatted
  # (mainly for good column widths).
  def format
    update_widths!

    a = []

    ([@header] + @rows).each do |row|
      line = ''
      @header.size.times do |i|
        line += row[i].to_s.ljust(@widths[i] + 2)
      end
      a.push(line + "\n")
    end

    a
  end

private

  # Saves maximum width per column into the +@header+ array.
  def update_widths!
    @header.size.times do |i|
      ([@header] + @rows).each do |row|
        @widths[i] = row[i].size if @widths[i] < row[i].size
      end
    end
  end
end
