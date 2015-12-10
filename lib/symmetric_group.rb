class SymmetricGroup
  def initialize(n)
    @n = n
    @elements = (1..n).to_a.permutation.map { |perm|
      Permutation.new(perm)
    }
  end

  def find(str)
    @elements.select {|p| p.to_s == str }.first
  end

  def compose(a_str, b_str)
    a = @elements.select {|p| p.to_s == a_str }.first
    b = @elements.select {|p| p.to_s == b_str }.first
  end

  def size
    @elements.size
  end

  def to_s
    "{#{@elements.map(&:cycle_form).join(", ")}}"
  end
end

