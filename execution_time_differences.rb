def my_min(array)
  smallest = array.first

  array.each do |x|
    if x < smallest
      smallest = x
    end
  end

  smallest
end


def largest_sub_sum(array)
  sub_arrays = []

  0.upto(array.length - 1) do |i|
    i.upto(array.length - 1) do |j|
      sub_arrays << array[i..j]
    end
  end

  max = sub_arrays[0].inject(:+)
  sub_arrays.each do |sub_array|
    current_sum = sub_array.inject(:+)
    max = current_sum if current_sum > max
  end

  max
end
