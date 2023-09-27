=begin
P: given a string, return the string with the first and lasat chars in place, but
   the chars in btwn sorted alphabetically, punctuation in place.
  i: string
  o: string
  explicit: words are seperated by spaces
            not caps sensitive

E/D: scramble_words('professionals'), 'paefilnoorsss'

A: high: iterate over word[1..-2], sort, return first character plus that plus last character
         only sort if abc,

    low: - set var for first letter , and another for last
         - convert middle to char array, sort
           -if letter is non char, don't sort
           - if multiple words first iterate over words, apply the above

=end

def scramble_words(string)
  abc = ('a'..'z').to_a
  string = string.split(" ")
  if string.empty? || string[0].size < 4
    return string.join
  elsif string.size == 1
    return string[0][0] + string[0][1..-2].chars.sort.join + string[0][-1]
  else
    string.map! do |word|
      word[0] + word[1..-2].chars.sort{|a, b| (a <=> b) if abc.include?(a) && abc.include?(b)}.join + word[-1]
    end
  end
  string.join(" ")
end


p scramble_words('card-carrying')
#p scramble_words('professionals')
#p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.")
