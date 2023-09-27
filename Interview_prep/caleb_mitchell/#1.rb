require 'pry'
=begin
P: givan an array of consecutive letters, increasing letters, return missing letter.
 i: array
 o: string (one letter)

E / D: determine_missing_letter(['a','b','c','d','f']) == 'e
          'e' is the missing letter
    array, array of abcs

A:  high: create an array of letters, first till last in given array, then
          iterate over it and return the one that isn't in our array
    issues?

    low: - intialize new array, starting from first element till last
            - (first..last).to_a
         - iterate over abc array, return the element that isn't included in the original
           array

=end

def determine_missing_letter(arr)
  abc_array = (arr.first..arr.last).to_a

  abc_array.each do |letter|
  return letter if arr.include?(letter) == false
  end

end

p determine_missing_letter(['a','b','c','d','f']) == 'e'
p determine_missing_letter(['O','Q','R','S']) == 'P'
