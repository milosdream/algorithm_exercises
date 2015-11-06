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
