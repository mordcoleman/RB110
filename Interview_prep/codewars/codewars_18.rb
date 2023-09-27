=begin
P: given an array of numbers, return a hash of each number as key and times it appears
   as the value
   i: array
   o: hash
   r: if empty or nil, return nil

E / D: group_and_count([0,1,1,0]) ==  {0=>2, 1=>2}

A: - init results hash
   - iterate over array, adding or creating key and value +1
   -return hash
=end

def group_and_count(arr)
  return nil if arr == nil || arr.empty?
  results = {}
  arr.each do |num|
    if results.include?(num)
      results[num] += 1
    else
      results[num] = 1
    end
  end
  results
end

p group_and_count([0,1,1,0]) ==  {0=>2, 1=>2}
