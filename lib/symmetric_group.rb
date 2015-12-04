class SymmetricGroup
  def initialize(n)
    @n = n
    @elements = (1..n).to_a.permutation
  end

  def size
    @elements.size
  end
end

