=begin
P: given a string, find the length of the longest substring that is the same in reverse
 i: string
 o: number

E/D: longest_palindrome("a") == 1
     longest_palindrome("baa") == 2

A: high: iterate over string, selecting all sub that equal themselves when reversed, to results
         array, then retrieve the longest

    low: -init results array
         - iterate over the string, select all subs that == sub.reverse
         - select the maximum sized one and return

=end

def longest_palindrome(str)
  results = []

  str = str.chars

  0.upto(str.size - 1) do |idx1|
    idx1.upto(str.size - 1) do |idx2|
      results  << str[idx1..idx2] if str[idx1..idx2] == str[idx1..idx2].reverse
    end
  end
  results.max_by{|sub| sub.size}.size
end


p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
