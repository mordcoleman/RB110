=begin
P: given a number, create the next biggest number using the same digits
  i: integer
  o: integer
  explicit: if none, return -1

E/D: next_bigger_num(2017) == 2071
     next_bigger_num(513) == 531
    the next biggest number is found by adjusting the last two places

A: high: replace the last two digits with sorted version of itself

   low: - convert number to an array of digits through becoming a string (arr)
        - reassign last 2 digits to a sorted version
           arr[-2..-1] = arr[-2..-1].sort ...
        - if it's the same, or it has only one digit, return -1, otherwise reassign
        - join together back to numbr
=end

def next_bigger_num(num)
  num = num.to_s.chars
  if
    num.size == 1 || num[-2..-1] == num[-2..-1].sort {|a, b| b <=> a}
  return -1
  else
    num[-2..-1] = num[-2..-1].sort {|a, b| b <=> a}
  end
  num.join.to_i
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798




# def spiral(arr)
#   return false if arr.count(arr.max) > 1

#   max_index = arr.index(arr.max)

#   left = arr[0...max_index]
#   right = arr[max_index + 1..-1]

#   left == left.sort && right == right.sort{|a,b| b<=>a}
# end

p spiral([1, 2, 4, 3, 2, 1]) #== true
# p spiral([1, 2, 4, 6, 4, 2, 1]) == true
# p spiral([0, 3, 5, 4, 3, 2, 1]) == true
# p spiral([0, 3, 5, 5, 4, 3, 2, 1]) == false
# p spiral([1, 2, 4, 6, 4, 2, 4]) == false
# p spiral([1, 5, 4, 6, 4, 2, 1]) == false
