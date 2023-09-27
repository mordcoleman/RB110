require 'pry'
=begin
P: given an array of strings, return an array of letters that appear in all strings
  explicit: if a letter repeats, repeat it in the answer
  implicit: return empty array if not
  i: array
  o: array

E/ D: p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]


A: high: iterate over first word, tallying to a hash, then iterate over hash and other words,
         checking if key doesn't exist, value switch to zero,
         if it does, change value to count in current word

    low: - init results array
         - get hash of first word, w/ letters as key and amount as value
         - iterate over hash and other words, selecting only letters that exist in all
         - iterate over hash and the rest of the array
           - with each element, check if key is included in word
             - if yes, change value to current count in word
             - otherwise, change value to zero
         - iterate over final hash, adding each key whose value is more than 0
           to results array

=end



# def common_chars(input)
#   results = []

#   input[0].chars.uniq.each do |letter|
#     count = []
#     input.each do |word|
#       count << word.count(letter)
#     end
#     binding.pry
#     # put letter into results count.min times
#     count.min.times { results << letter }
#   end
#   results
# end


p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "cook", "lock"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

















  # Find the longest substring in alphabetical order
# Example: the longest alphabetical substring in
# "asdfaaaabbbbettavvfffffdf" is "aaaabbbbett",
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.


=begin
P: given a string, return the first and longest substring that is in alphabetical order
  i: String
  o: string
  explicit: at least one letter
           if there's more than one, return the first

E/D:   longest('abcdeapbcdef') == "abcde"

       there are two sub here, we return the first
       longest('zyba') == 'z'
       here, each is in abc order by itself, we return the first

A: high: get all substrings, find the ones that when ordered  remain unchanged, then find the longest one

   low: init an array
         - iterate over array of chars in String
          - (2 uptos)
            'asd' -> a, as, asd, s, sd, d
        - select the ones that when ordered equal themselves
              a == a, as == as, s == s, sd != ds, d == d
        - select the longest sub
              as

=end

def longest(str)
  subs = []
  str = str.chars

  0.upto(str.size - 1) do |idx1|
      idx1.upto(str.size - 1) do |idx2|
      subs << str[idx1..idx2]
    end
  end
  subs = subs.select do |sub|
    sub == sub.sort
  end
   subs.max_by {|sub| sub.size}.join
end

# p longest('asd') == 'as' # a, as, asd
# p longest('nab') == 'ab'
#p longest('apbcdefabcde') #== "abcde"
# p longest('asdfaaaabbbbettavvfffffdf') == 'aaaabbbbett'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == "z"
# p longest('zyba') == 'z'

