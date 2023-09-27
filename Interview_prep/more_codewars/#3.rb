=begin
P: given string and substring, return the number of times the substring appears
  i: string, substring
  o: number

E/D: solution('abcdeb','b') 2
     array

A: high: get all possible subarrays, check the amount of times given sub appears in
         them
    low: - iterate over string converted to array
         - retrieve all subarrays
         - send all to sub var(init in beginning)
         - get count of given sub from sub var, return
=end

def solution(str, sub)
  subarrays = []

  0.upto(str.size - 1) do |idx1|
    idx1.upto(str.size - 1) do |idx2|
      subarrays << str[idx1..idx2]
    end
  end

  subarrays.count(sub)
end


p solution('abcdeb','b')
