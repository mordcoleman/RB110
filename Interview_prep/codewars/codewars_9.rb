=begin
P: given a number, return sum of all multiples of 3 & 5 below number.
  i: number
  o: number
  rules: if number is negative, return 0
         if number is multiple of bith 3 & 5, count only once

E/D: solution(10) == 23
      the multiples are 3, 5, 6, and 9 which added together is 23

    integer, array

A: -intialize array of numbers 1 - number passed in, -1
   - iterate over array, checking if each is a multiple of 3 or 5
     - if yes, save to new array
   - add up numbers in new array
=end


def solution(number)
  arr = (1...number).to_a
  arr.select! do |num|
    num % 3 == 0 || num % 5 == 0
  end.sum
end


p solution(10)
