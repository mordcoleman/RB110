=begin
P: given a sentence string, return the same string with any occurence of a sequence of
   numbers converted into a string of digits.
   i: string
   o: string

E: word_to_digit('Please call me at five five five one two three four. Thanks.')
              == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

thoughts: need a way to seperate puntuation from word..
          add if clause that says remove punctuation, then add it back in?
A: - create hash of numbers and corresponding digits
   - iterate over sentence split into array of words
    - at each iteration, check if word is included in keys
      - if so, substitute for corresponding digit
    - return string
=end

def word_to_digit(str)
  hash = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
           'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }
  str = str.split
  str.each_with_index do |word, index|
   hash.each do |k, v|
     if word == k
       str[index] = v
     elsif word == k + "."
       str[index] = v + "."
     end
   end
  end
  str.join(" ")
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
