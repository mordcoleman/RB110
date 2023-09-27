=begin
P: given an array (n) and an integer (s), find the smallest length of a contiguous subarray,
   such that it's sum > the integer
  explicit: if none, return 0
  i: array, number
  o: number(length of subarray)

E/D: minSubLength([2, 3, 1, 2, 4, 3], 7) == 2

A: high: get all subarrays that when summed > s, then retrieve the smallest one
   low: - init sub_arrays array
        - iterate over array, extract all sub arrays that when added > s
           - start with first till it self, then till the next etc.
           - move to the second element and repeat
        - return 0 if subarray is empty
        - retrieve the subarray with the smallest length
        - return that length

=end

def minSubLength(arr, integer)
  sub_arrays = []

  0.upto(arr.size - 1) do |idx1|
    idx1.upto(arr.size - 1) do |idx2|
      sub_arrays << arr[idx1..idx2] if arr[idx1..idx2].sum > integer
    end
  end
  return 0 if sub_arrays.empty?
  sub_arrays.min_by {|sub| sub.size}.size
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 3
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
