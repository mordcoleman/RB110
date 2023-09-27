=begin
P: given array of numbers, find the one that apears an odd number of times
  i: array
  o: integer
  there will always be only one integer odd times
E / D: [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

       array - hash
A: - init results hash
   - iterate over array, adding numbers as keys and times as values
   - return the key w/ odd value
=end

def find_it(arr)
  results = {}
  arr.tally.each {|k, v| return k if v.odd?}
  arr.each do |num|
    if results.include?(num)
      results[num] += 1
    else
      results[num] = 1
    end
  end
  results.each {|k, v| return k if v.odd?}
end

# def find_it(arr)
#   arr.tally.each {|k, v| return k if v.odd?}
# end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5


