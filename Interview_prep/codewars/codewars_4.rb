=begin
P: given a string, return the length of the longest vowel substring
  i: string
  o: integer

E / D: solve("codewarriors") == 2
       solve("suoidea") == 3
       solve("iuuvgheaae") == 4
  string, array

A: - initialize results array
   - create array of vowels
   - convert string to array
   - iterate over array, retrieve subarrays that are vowels to new array
       - start with the first character, till itself
         - if it's a vowel, add to results array
           - we know it's a vowel by checking if all characters are included in vowel hash
       - next, start with the first character till the next
         - if they're both vowels, add to results array
    - retrieve largest substring from results array
      - find max subarray in results
      - return size of that subarray
=end

def solve(string)
  vowels = %w(a e i o u)
  results = []
  string = string.chars

  0.upto(string.size - 1) do |idx1|
    idx1.upto(string.size - 1) do |idx2|
      results << string[idx1..idx2] if string[idx1..idx2].all?{|char| vowels.include?(char)}
    end
  end
results.max_by {|arr| arr.size}.size
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4



