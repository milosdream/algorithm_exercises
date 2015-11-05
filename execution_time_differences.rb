def my_min(array)
  smallest = nil

  0.upto(array.length-1) do |i|
    0.upto(array.length-1) do |j|
      break if array[j] < array[i]
      smallest = array[i]
    end
  end

  smallest
end
