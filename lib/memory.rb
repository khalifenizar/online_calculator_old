class Memory
  def initialize(file)
    @file = file
  end

  def save(value)
    IO.write(@file, value)
  end

  def load
    IO.read(@file).to_f
  end
end
