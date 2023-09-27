require 'pry'
=begin
P: given 2 numbers, return an array with all primes in btwn,
   including given numbers
  i: 2 numbers
  o: array

E / D: find_primes(11, 20) == [11, 13, 17, 19]
        - all the numbers in the array can only be divided by 1 and themselves

        - array

A: high: starting from first number till last, and only add to
         it the numbers that are prime

   issues: know how to find prime number
           - check if number can be divided more than 2 times from 1 till itself

   low: - init results array
        - init array first num to last
        - start iterating over num  array
          (3, 10) -> 3
        -  at each number, check if it's prime
          - init times var
          - iterate over all the numbers till it, checking that it can only be divided by itself and 1
              - 3 % 3, 3 % 4,.. 3 % 10
            - add 1 to times each time == 0
          - if times == 2, add number to results array
          - otherwise, next number in array
        - return the results array
=end

def find_primes(num1, num2)
  results = []
  num_array = (num1..num2).to_a

  num_array.each do |num|
    times = 0
    1.upto(num) do |number|
      times += 1 if num % number == 0
    end
    results << num if times == 2
  end
  results
end

p find_primes(3, 10) == [3, 5, 7]
p find_primes(11, 20) == [11, 13, 17, 19]
p find_primes(100, 101) == [101]
p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
p find_primes(1, 2) == [2]
