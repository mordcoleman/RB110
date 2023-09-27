=begin
P: given an array,count all pairs( of same number) and return count
   rules: array can be empty
          if more than one, count each pair once
   i: array
   o: integer

E/ D: [1, 2, 5, 6, 5, 2]  -->  2
    thera are two pairs, that of 2 and 5
  array, integer

A: - initialize hash
   - iterate over the array
    - at each iteration, add key and or plus 1 for value
   - iterate over hash, checking values by dividing by two
     - use map to store return values
   - add return values up and return
=end

def pairs(arr)
  result = {}
  arr.each do |char|
    if result.include?(char)
      result[char] += 1
    else
      result[char] = 1
    end
  end
  
  result.values.map do |value|
    value / 2
  end.sum
end

p pairs([1, 2, 5, 6, 5, 2]) #== 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# p pairs([1000, 1000]) == 1
# p pairs([]) == 0
# p pairs([54]) == 0
