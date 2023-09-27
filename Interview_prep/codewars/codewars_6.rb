=begin
P: given a (nonempty) string, find minimum substring (t) and maximum number (k),
   such that the orginal string is t muliplied k times
  i: string
  o: array of t and k

E / D: s = "ababab" => ["ab", 3]
       s = "abcde"  => ["abcde", 1]

A: - results array
   - convert string to array of characters
   - extract all substrings to results array
     - start with first char till the end
     - with each char, retrieve substring till itself, then the next etc
   - iterate over substrings, see which one returns the maximum count from string
   - initialize hash
      - iterate over the array
      - at each iteration, add key and or plus 1 for value
   - iterate over array, select the one that one multiplied times string size / sub size,
   equals string

=end

def f(string)
  result_array = []
  string = string.chars
  0.upto(string.size - 1) do |idx1|
    idx1.upto(string.size - 1) do |idx2|
      result_array << string[idx1..idx2]
    end
  end
  # result_hash = {}
  #  result_array.each do |sub|
  #   if result_hash.include?(sub)
  #     result_hash[sub] += 1
  #   else
  #     result_hash[sub] = 1
  #   end
  #  end
   result = result_array.select do |sub|
    sub * (string.size / sub.size) == string && sub.size < string.size
   end
  [result.uniq.flatten.join , result.size]
end



p f("ababab") == ["ab", 3]
 p f("abcde") == ["abcde", 1]
