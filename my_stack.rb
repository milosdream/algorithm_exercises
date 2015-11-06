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
    @max = []
    @min = []
  end

  def enq(el)
    @queue.push(MyStack.new.push(el))
    @max.push(el) if @max.empty? || el > @max.last
    @min.push(el) if @min.empty? || el < @min.last
  end

  def deq
    p "@queue = #{@queue}, @min.first = #{@min.first}, @max.first = #{@max.first}"
    p "@max = #{@max}, @min = #{@min}"
    @max.pop if @queue[0][0] == @max.first
    @min.pop if @queue[0][0] == @min.first
    @queue.shift.pop
  end

  def size
    @queue.count
  end

  def empty?
    @queue.empty?
  end
end
