class Permutation
  attr_reader :row

  def initialize(row)
    @row = row
  end

  def matrix
    [row.sort, row]
  end

  def cycle
    return "()" if row.sort == row

    cycles = {}

    while cycles.values.sort != row
    end

  end
end
