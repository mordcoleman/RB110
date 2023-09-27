=begin
P:  given a word problem, return the answer as an integer
  i: string
  o: integer

E/ D: p solver("What is 15 divided by 3?") == 5

A: high: retrieve the integers from the problem, then detect if problem says 'divided', 'multiplied'
         etc, and perform calculation

    low: - init array to store numbers
         - iterate over array
           - check for chars == chars.to_i
           - send to num_array
         - iterate again, check for words 'multiplied', divided, and perform appropriate
            operation
=end

def solver(str)
num_array = []
str = str[0..-2].split
str.each do |el|
  num_array << el.to_i if el == el.to_i.to_s
end
if str.include?('plus')
  num_array.sum
elsif str.include?('minus')
  num_array.inject(:-)
elsif str.include?('divided')
  num_array.inject(:/)
else
  num_array.inject(:*)
end
end


p solver("What is 15 divided by 3?") #== 5
p solver("What is 15 minus 3?")
p solver("What is 15 plus 3?")
p solver("What is 15 multiplied by 3?")
