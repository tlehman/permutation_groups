class SymmetricGroup
  def initialize(n)
    @n = n
    @elements = (1..n).to_a.permutation.map { |perm|
      Permutation.new(perm)
    }
  end

  def size
    @elements.size
  end

  def to_s
    "{#{@elements.map(&:cycle_form).join(", ")}}"
  end
end

