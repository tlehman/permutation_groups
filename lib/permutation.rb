require 'set'

class Permutation
  class NotBijectionError < StandardError; end
  attr_reader :row

  def initialize(row)
    raise NotBijectionError if row.uniq.size != row.size

    @row = row
  end

  def matrix_form
    [row.sort, row]
  end

  # sorted row
  def srow
    @srow ||= row.sort
  end

  def sign
    inversions = row.sort.flat_map { |x| row.sort.map { |y| [x,y] } }.
      select { |(x,y)| x < y }.
      select { |(x,y)|
        sx = row[srow.index(x)]
        sy = row[srow.index(y)]

        sx > sy
    }.count
    (-1)**inversions
  end

  def cycle_form
    return "()" if row.sort == row

    cycles = []
    untraced = srow.dup

    while untraced.size > 0
      # st is the start of a cycle
      st = untraced.shift
      nx = row[srow.index(st)]
      next if st == nx
      cycle = [st]

      while st != nx
        untraced.delete(nx)
        cycle << nx
        # record that nx has been traced
        # follow the permutation
        nx = row[srow.index(nx)]
      end
      cycles << cycle
    end
    format(cycles)
  end

  def format(cycles)
    output = ""
    cycles.each do |cycle|
      output << "("
      output << cycle.map(&:to_s).join(" ")
      output << ")"
    end
    output
  end
end
