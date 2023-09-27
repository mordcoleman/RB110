=begin
P: given a string of integers, return number of all possible odd-numbered substrings
  i: string
  o: integer

E: "1341" == 7
     this is because the possible substrings are: 1, 1, 3, 13, 41, 341, 1341

  string, array, integer

A: - init results array
   - convert string to array
   - convert each char to integer
   - iterate over array, retrieve all possible substrings
     - start with the first character, till itself
        - if it's odd, add to results array, joined as a number
        - join as string but then convert back to number to check if odd
     - next, start with the first character till the next
        - if it's odd, add to results array, joined as a number
     - etc
    - retrieve size of results array
=end

def solve(str)
  results = []
  str = str.chars.map!{|num| num.to_i}

  0.upto(str.size - 1) do |idx1|
    idx1.upto(str.size - 1) do |idx2|
      results << str[idx1..idx2].join.to_i if str[idx1..idx2].join.to_i.odd?
    end
  end
  results.size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
