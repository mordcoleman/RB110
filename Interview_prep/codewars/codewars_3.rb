=begin
P: given a string and a substring, return the number of times the substring
   is found in the string
  i: string and substring
  o: integer

E/D:
     solution('abcdeb','b') == 2
     solution('abcdeb', 'a') ==  1
     solution('abbc', 'bb') == 1

A: - initialize result array
   - iterate over string coverted to array
   - retrieve subarrays of all pairs
     - use outer upto to iterate from beginning to end
     - use inner upto to iterate from current element till the end
     - at each iteration, extract a subarray, with current element in
       the outer upto and the element in the inner upto
   - save all subarrays to result array
   - check how many times substring appears as a subarray
     - convert arrays to strings
     - use .count
=end

def solution(string, sub)
  string = string.chars
  result = []
  0.upto(string.size - 1) do |index1|
    index1.upto(string.size - 1) do |index2|
        result << string[index1..index2]
    end
  end
  result.map! {|subarr| subarr.join}
  result.count(sub)
end
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') ==  1
p solution('abbc', 'bb') == 1
