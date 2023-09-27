require 'pry'
=begin
P: given a string, return true if all parenthesis in the string have a match, that is, each '(' has
   a ')'.
   i: string
   o: boolean
  rules: each balanced pair starts with '('.
         no parenthesis is also true
E / D:  balanced?('What (is) this?') == true
        balanced?('What is) this?') == false

NOTES: - an odd amount is always false
       - a ) without a ( preceding it will be false
A:
   high: we need to find the amount of () that are odd, and from the evens, the ones that have ')'
         w/o '(' preceding it. the hard part is the ones that have ) befor (. try using
          a toggle system, start with 0 etc

   low:
=end

def balanced?(str)
  balance = 0

  str.chars.each do |el|
    if el == "("
     balance += 1
    elsif el == ")"
     balance -= 1
    end
  return false if balance < 0
  end
  balance == 0 ? true:false
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
