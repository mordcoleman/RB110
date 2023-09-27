=begin
P: given an array of integers, count all pairs(anything 2+) and return their count
  i: array
  o: integer

E/D: [1, 2, 5, 6, 5, 2]  -->  2

A: high: tally, then return count of values 2+

    low: - tally array
         - set count var to 0
         - iterate over hash
          - if value is more than 1, count += value divided by 2
         - return count
=end


def pairs(arr)
  hash = {}

  arr.each do |num|
    if hash.include?(num)
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  count = 0

  hash.each do |_, v|
    count += v/2 if v > 1
  end
  count
end

p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
