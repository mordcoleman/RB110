=begin
P: given an array, reverse w/o using reverse method
 i: array
 o: array

E/D: [1, 2, 3, 4] -> [4, 3, 2, 1]

A: high: remove last item from array array.size times

   low: - create result array
        - keep popping the array array.size times

=end

def reverse(arr)
  results = []
  (arr.size).times do |time|
    results << arr.pop
  end
  results
end

p reverse([1, 2, 3, 4])
