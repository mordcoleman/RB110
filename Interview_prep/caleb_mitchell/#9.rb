=begin
P: given a string, check if it can be constructed by adding multiple copies of one of it's substrings
   i: string
   o: boolean

E/D: repeated_substring_pattern("aabaaba") == false
     repeated_substring_pattern("abaababaab") == true

A: high: check if any substring, with the string size / sub size times, will equal sub string

   low: - iterate over string converted to array of chars
        - save all subs to a new array
        - remove sub that is the same as string
        - iterate over subs, checking if sub * (string size divided by sub size) == string
        - if yes return true
        - otherwise return false
=end

def repeated_substring_pattern(str)
  str = str.chars
  subs = []
  0.upto(str.size - 1) do |idx1|
    idx1.upto(str.size - 1) do |idx2|
    subs << str[idx1..idx2]
    end
  end
  subs.delete(str)
  subs.each do |sub|
    return true if  sub * (str.size / sub.size) == str
  end
  false
end


p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
