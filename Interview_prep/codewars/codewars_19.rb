=begin
P: given a string return same string w/ all even -indexed chars uppcased and all odd downcased,
   starting over at each word
   i: string
   o: string

E / D: weirdcase('This is a test') ==  'ThIs Is A TeSt'

string, array (of subs), string

A: - convert string to array of words
   - init results array
   - iterate over each word as subarray of chars
     - use each and manipulate with up and downcase methods
   - if array is even, upcase, else downcase
     - send mutated word to results array
   - join back to sentence
=end

def weirdcase(str)
  str = str.split
  results = []
  results = str.map do |sub|
    sub.chars.map.with_index do |char, index|
       if index.even?
        char.upcase
       else
        char.downcase
       end
    end.join
  end
  results.join(" ")
end

p weirdcase('This is a test') ==  'ThIs Is A TeSt'
