require 'byebug'
def anagrams(word)
  return [word] if word.length <= 1
  prev_anagrams = anagrams(word[0...word.length - 1])
  last_letter = word[-1]
  anagrams = []
  prev_anagrams.each do |anagram|
    (0..anagram.length).each do |idx|
      anagrams << anagram[0...idx] + last_letter + anagram[idx...anagram.length]
    end
  end
  anagrams
end

def anagram?(word1, word2)
  word1_anagrams = anagrams(word1)
  word1_anagrams.include?(word2)
end

#O(n^2)
def second_anagram?(word1, word2)
  return false if word1.length != word2.length
  word1 = word1.split("")
  word2 = word2.split("")
  word1.each do |char|
    word1.delete(char)
    word2.delete(char)
  end
  word1.empty? && word2.empty?
end


def third_anagram?(word1, word2)
  sorted1 = word1.split("").sort
  sorted2 = word2.split("").sort
  sorted1 == sorted2
end


def fourth_anagram?(word1, word2)
  word1_hash = Hash.new(0)
  word2_hash = Hash.new(0)

  word1.each_char do |c|
    word1_hash[c] += 1
  end

  word2.each_char do |c|
    word2_hash[c] += 1
  end

  word1_hash == word2_hash
end
