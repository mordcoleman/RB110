require "pry"
=begin
P: given a list of integers, return minimum number that can be added to list,
   so that the sum of list should be the closest prime number
   i: array of numbers
   o: number

E/ D: minimumNumber ({3,1,2}) ==> return (1)
   the list currently equals 6, by adding 1, we get 7, the nearest prime number

  array

A:
   - init array of all numbers from 1 till sum (total) of numbers in array (nums)
   - loop over nums, checking if total can be evenly divided more than 2 times
     - set counter to 1
     - if it can, increase it by counter
     - keep increasing counter till total can only be evenly divided by 2 number in num (which
       will be itself and 1)
         - iterate over nums, checking if total can be divided evenly by current num, if yes
           add num to new array
         - check if array's size is more than 2
     - return counter
=end

def minimum_number(arr)
  arr = arr.dup
  loop do
    total = arr.sum
    nums = (1..total).to_a
    counter = 0
    result = nums.select do |num|
      total % num == 0
    end
    #binding.pry
    if result.size != 2
      total += 1
      counter += 1
    else
      return counter
    end
  end
end

 p minimum_number([3,1,2]) #== 1
# p minimum_number([2,12,8,4,6]) #== 5
# p minimum_number([50,39,49,6,17,28]) #== 2
