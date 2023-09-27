=begin
P: given a string, return a hash containing a) % of lowercase chars, b) % of uppercase chars
   c) % of neither chars
  i: string
  o: hash

E / D: letter_percentages('abCdef 123')
       == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
      in the above, ther are 5 lowercase, 50% of the 10 chars etc..

 A:  high: need to iterate over string, check if each characters is 1 of 3 things, if so add
           to a hash value, then use percentage formula, replace hash value w/ that

     issues: need to check if an abc
             - create array of abcs

     low: - create arrays of abcs
          - init hash with lowercase, uppercase, neither keys; values set to 0
          - iterate over string in char array form
          - check if lowercase
            - char is included in abc array
            - if so, add one to lowercase value
          - otherwise, check if uppercase
            - char is equal to uppercase form? and included in abcs when downcased
            - if so, add one to uppercase value
          - otherwise, add to neither
          - iterate over hash
          - convert value to it's percentage of total chararcters
            - divide number of chars by value, multiply by 100
          - re-assign value to result, in float version with one zero
=end

def letter_percentages(str)
  abc = ('a'..'z').to_a
  hash = {lowercase: 0, uppercase: 0, neither: 0}

  str.chars.each do |char|
    if abc.include?(char)
      hash[:lowercase] += 1
    elsif char == char.upcase && abc.include?(char.downcase)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
    hash.each do |k ,v |
      hash[k] = (hash[k] / str.length.to_f) * 100
    end
    hash
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
