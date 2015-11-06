load 'my_stack.rb'

def max_w_range(arr, win)
  current_max_range = nil

  0.upto(arr.length-1) do |i|
    window = arr[i...i+win]

    window_max = window.max
    window_min = window.min
    local_max_range = window_max - window_min

    current_max_range = local_max_range if current_max_range.nil? || current_max_range < local_max_range
  end

  current_max_range
end

def optimax_win(arr, win)
  q = MinMaxStackQueue.new

  0.upto(win-1) do |i|
    q.enq(arr[i])
  end

  abs_max = q.max - q.min

  q.size.upto(arr.length-1) do |i|
    q.deq
    q.enq(arr[i])
    local_max = q.max - q.min
    abs_max = local_max if local_max > abs_max
  end

  abs_max
end
