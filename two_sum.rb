def bad_two_sum(arr, target_sum)

  0.upto(arr.length - 2) do |i|
    (i + 1).upto(arr.length - 1) do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end

  false
end

# time complexity == O(n**2)

def okay_two_sum(arr, target_sum)

  sorted_arr = arr.sort

  sorted_arr.each do |el|
    p "#{el}"
    return true unless (sorted_arr.bsearch {|x| !(el.eql? x) && x == target_sum - el}).nil?
  end

  false
end

# time complexity == O(n*log(n))

def good_two_sum(arr, target_sum)
  hash_map = Hash.new

  arr.each_with_index do |el, i|
    hash_map[i] = el
  end

  hash_map.each do |k, v|
    target = target_sum - v
    return true if hash_map.has_value?(target) && hash_map.key(target) != k
  end

  false
end

#time complexity == On
