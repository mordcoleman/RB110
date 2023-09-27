=begin
P: given a a string, return with all 5 or more letters reversed
  i: string
  o: string

E/D: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

A: high: check if word is 5 or more chars, if so reverse word, return string

   low: - convert to array of words
        - iterate over array(map)
          if word size is 5 or more, reverse in place
        - return in string form
=end

def spinWords(str)
  str = str.split

  # str.map! do |word|
  #   if word.size >= 5
  #     word.reverse
  #   else
  #     word
  #   end
  # end.join(" ")
end

#p spinWords( "Hey fellow warriors" ) == "Hey wollef sroirraw"
p spinWords("Welcome")
