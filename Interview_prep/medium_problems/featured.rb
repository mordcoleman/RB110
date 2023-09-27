=begin
P: given a number, check for the next 'featured' number, that is it's  a mult. of 7
   it's odd, and it's digits occur once
  i: number
  o: number
  explicit: return error if none

E/D: featured(12) == 21 18 is mult. of 7 but not odd, so it's 21

A: high: start with given number, keep adding 7 and check if it's odd, then check each
         digit to make sure they're unique, if so return

   low: - set counter to given number
        - loop, add 7 and check if odd
          - if yes, add to array and check if equal to uniq
            133.to_s.chars == 133.to_s.chars.uniq is false
          - if yes, return
          - if no, add 7
         - how to deal with none?
=end

def featured(num)
  counter = num
  counter += 1 if counter.even?
  loop do
    return counter if(counter % 7 == 0) && counter.to_s.chars == counter.to_s.chars.uniq && counter > num
    counter += 2
    break if counter >= 9_876_543_210
  end
  'There is no possible number that fulfills those requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
