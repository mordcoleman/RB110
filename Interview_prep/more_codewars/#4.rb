require 'pry'
=begin
P: given an array of words, return an array of the number of letters in each that
   occupy the same spot in the alphabet
  i: array
  o: array

E/D: solve(["abode","ABc","xyzD"]) = [4, 3, 1]
    array of abcs

A: high: create array of abcs, then iterate over it and given array, getting  the count of
         abc's whose indecies match

    low: - create abc array
         - mutate all letters in array to lowercase to match abc array
         - iterate over both arrays, for each which match, add number to array
            - iterate each word, checking if index equals index of letter in abc
            - if so, replace with 1, else zero
           - return sum in place of word

=end


def solve(arr)
  abc = ('a'..'z').to_a
  arr = arr.map {|word| word.downcase.chars}

  arr.map! do |word|
    word.map.with_index do |letter, index|
      if index == abc.index(letter)
        1
      else
        0
      end
    end.sum
  end
end


p solve(["abode","ABc","xyzD"])
