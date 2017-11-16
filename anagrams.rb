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
