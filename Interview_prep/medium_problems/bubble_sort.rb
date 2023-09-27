=begin
P: given an array, sort it using the bubble sort algorithm
  i: array
  o: sorted array

E/D: array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

A: high: iterate over the array, comparing two elements at a time, swap if first is more
         then second. repeat until no swaps are made.

    low: - set swapped toggle variable to false
         - set counter to 0
         - loop over the array, checking if the first 2 are >
           - if yes, swap
              arr[counter], arr[counter + 1] = arr[counter + 1], arr[counter]
           - or if not
           -increase counter by 1
         - when counter equals arr.size, reset to 0
         - each time a swap is performed, assign true to swapped toggle
         - if toggle ever equals false at the end of an iteration across all elements,
          break and return sorted array

=end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end


# array = [5, 3]
# bubble_sort!(array)
# p array #== [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array #== [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
