
=begin
P: given a string, determine if it is a panagram
  i: string
  o: boolean
  rules: ignore non-abcs
E/ D: "The quick brown fox jumps over the lazy dog." => true

A: - create array w/ all abcs
   - convert string into  array of chars, downcased
   - sort string
   - check if array includes all abcs
     - iterate over using all?, see if string includes all letters in abc array
=end


def pangram?(string)
  abc = ("a".."z").to_a
  string = string.downcase.chars
  abc.all?{|letter| string.include?(letter)}
end

p pangram?("The quick brown fox jumps over the lazy dog.")
p pangram?("This is not a pangram.")
