=begin
P: given two arrays a & b, check if they have all elemnts in b are multiples of all elements in
   a, that is, squared versions.
  i: 2 arrays
  o: boolean

E: comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361])
   will return true, because the element sin b are the elemnts in a squared

A: - iterate over array b and a
   - at each iteration, check if the number  divided by any number in a equals that number in a
   - if all are true return true

=end

# def comp(a, b)
#   if b.all? do |num_b|
#     a.any? do |num_a|
#       num_b / num_a == num_a
#     end
#   end
#   return true
# else
#   return false
# end
# end




def comp(a, b)
  return true if b.all? do |num_b|
    a.any? do |num_a|
      num_b / num_a == num_a
    end
  end
  false
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361])
