class MyStack

  def initialize
    @store = []
    @max = []
  end

  def max
    @max.last
  end

  def pop
    @max.pop if @store.last == @max.last
    @store.pop
  end

  def push(el)
    @store.push(el)
    @max.push(el) if @max.empty? || el > @max.last
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
    @queue = []
    @max = []
  end

  def enq(el)
    @queue.push(MyStack.new.push(el))
    @max.push(el) if @max.empty? || el > @max.last
  end

  def deq
    @max.pop if @queue.first == @max.first
    @queue.shift.pop
  end

  def size
    @queue.count
  end

  def empty?
    @queue.empty?
  end
end
