class MyStack

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def max
    @max.last
  end

  def min
    @min.last
  end

  def pop
    @max.pop if @store.last == @max.last
    @min.pop if @store.last == @min.last
    @store.pop
  end

  def push(el)
    @store.push(el)
    @max.push(el) if @max.empty? || el > @max.last
    @min.push(el) if @min.empty? || el < @min.last
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue < MyStack

  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def max
    unless @out_stack.empty?
      return @out_stack.max
    end

    unless @in_stack.empty?
      return @in_stack.max
    end
    nil
  end

  def min
    unless @out_stack.empty?
      return @out_stack.min
    end

    unless @in_stack.empty?
      return @in_stack.min
    end
    nil
  end


  def enq(el)
    until @out_stack.empty?
      @in_stack.push(@out_stack.pop)
    end

    @in_stack.push(el)
  end

  def deq
    until @in_stack.empty?
      @out_stack.push(@in_stack.pop)
    end

    @out_stack.pop
  end

  def size
    @in_stack.count + @out_stack.count
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end
end
