=begin
---------------- Problem
Input: string
Output: character that occurs the least in string
Rules: - if there is more than one 'least' char, return ther first occuring
       - case insensitive

---------------- Examples (modeling)

least_common_char("Hello World") == "h"
 - "h" isn't the only 'least' character, but it is the first

---------------- Data Structures

hash, array

---------------- Algorithm
- init result hash
- iterate over string converted into array of chars
- at each iteration, if key exists, add +1 to value, else create key value
  pair of char and 0
- use min_by to select the (first) key-value pair with smallest value
- return first element in array

=end

def least_common_char(str)
  results = {}
  str.chars.each do |char|
    if results.key?(char.downcase)
      results[char.downcase] += 1
    else
      results[char.downcase] = 1
    end
  end
  results.min_by {|k, v| v}[0]
end


p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'
