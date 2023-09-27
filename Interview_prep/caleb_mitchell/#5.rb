def letter_changes(str)
  abc = ("a".."z").to_a
  abc_upcase = ("A".."Z").to_a
  #xyz = ["x", 'y', 'z', 'a', 'b','c']
  #xyz_upcase = ["X", "Y", "Z", "A", "B", "C"]
  str = str.chars
  str.map do |char|



    if abc_upcase.include?(char)
      if abc_upcase.index(char) >= 23
        abc_upcase[abc_upcase.index(char) - 23]
      else
      abc_upcase[abc_upcase.index(char) + 3]
      end
    elsif abc.include?(char)
      if abc.index(char) >= 23
        abc.index(char)
        abc[abc.index(char)- 23]
      else
      abc[abc.index(char) + 3]
       end
    else
      char
    end
  end.join
end



p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')


# Have the method letter_changes(str) take the str parameter being passed and modify it using the following algorithm:

# Replace every letter in the string with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).

# Then return this modified string.


=begin

  -make an alphabet array with letters a-z
  -loop through the string character by character (map, each)
    -at the current character check whether it is a letter (see if it is included in the alphabet array lowercased)
    -if it is a letter
      -find the new letter using method new_letter
        -if the letter is the same uppercased then the letter at the new index should be lowercase
        -otherwise it should be downcased
    -if it is not a letter then add the current character to the new array (map)
    -return the new array joined at the spaces

=end


ALPHABET = ('a'..'z').to_a

def new_letter(index)
  if index < 23
    index = index + 3
    return ALPHABET[index]
  else
    index = index - 23
    return ALPHABET[index]
  end
end

def letter_changes(string)

  string.chars.map do |char|
    if ALPHABET.include?(char.downcase)
      letter = new_letter(ALPHABET.index(char.downcase))
      if char.downcase != char
        letter.upcase
      else
        letter
      end
    else
      char
    end

  end.join('')
end



p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
