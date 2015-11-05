def first_anagram?(str1, str2)
  all_anagrams = []

  letters = str1.chars

  possible_combos = letters.permutation.to_a

  possible_combos.each do |combo|
    all_anagrams << combo.join
  end

  all_anagrams.include?(str2)
end

def second_anagram?(str1, str2)

  letters1 = str1.chars
  letters2 = str2.chars

  letters1.each_with_index do |letter, i|
    letters2.each_with_index do |letter2, j|
      if letter2 == letter
        letters2[j] = " "
        break
      end
    end
    letters1[i] = " "
  end
  letters2.all? {|el| el == " "} && letters1.all? {|el| el == " "}
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end


def fourth_anagram?(str1, str2)
  letters1 = Hash.new {|h, k| h[k] = 0}

  str1.chars.each do |letter|
    letters1[letter] += 1
  end

  str2.chars.each do |letter|
    letters1[letter] -= 1
  end

  letters1.all? {|k, v| v == 0}
end
