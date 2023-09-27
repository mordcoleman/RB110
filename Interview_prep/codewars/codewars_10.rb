=begin
P: given a number, find the greatest product possible from 5 consecutive digits in number
  i: number
  o: number

E / D: greatest_product("123834539327238239583") // should return 3240

number, array, array (of sub - arrays)

A: - init results array
   - convert number to array
   - iterate over array, extracting all possible 5 consecutive digit substrings
     - iterate from the beginning, each time pulling current digit and next 4 into subarray,
       save to results array.
     - stop when there are only 4 digits left
       - iterate till -4 index?
   - sum each and return largest
=end

def greatest_product(n)
  results = []
  n = n.to_s.chars.map {|char| char.to_i}

  0.upto(n.size - 5) do |idx1|

    results << n[idx1, 5]

  end
  results.map! do |sub|
    sub.inject(:*)
  end.max
end

p greatest_product("123834539327238239583") #== 3240
