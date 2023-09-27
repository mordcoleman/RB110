=begin
P: given an array, find an index where the sum of integers on either side is the same
   i: array
   o: number
   explicit: if none, return -1

E/D: find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
     on either side of number 4, at index 3, the numbers == 6
     find_even_index([1, 2, 3, 4, 5, 6]) == -1
     there is no such index

A: high: start with first index(idx), add numbers till idx and after, see if equal, if not, move to
         the next

   low: - start w/ first index,loop w/ counter set to 0
          - check if sum of  0...counter == counter + 1.. -1
            - if yes return counter
          - otherwise increase counter by 1
        - break by arr.size and return -1
=end

def find_even_index(arr)
  counter = 0

  loop do
    return counter if arr[0...counter].sum == arr[(counter + 1)..-1].sum
    counter += 1
    break if counter == arr.size
  end
  -1
end


p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
