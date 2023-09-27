=begin
P: Given an array, return a new array that rotates the first element to the end
  i: array
  o: array
  rules: Don't mutate the original array

E/D: rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
     rotate_array(['a']) == ['a']

     array, array

A: - create a new array that starts with the second element in orig array
   - append first element from orig array to end of new array
=end

def rotate_array(arr)
  arr[1..-1] << arr[0]
end


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
