=begin
P: given a word, return a hash which stores the indexes of each letter
  explicit: - letters are keys
            - letters are symbols
            - indexes should be stored in an array
  implicit: if letter appears more than once, add that index to array of values

E/D: map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
     map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
     map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }

A: high: iterate over each letter and its index, adding the index and
         letter if necessary as you go
   low: - init hash
        - iterate over string converted to array of chars, with index
        - at each letter, check if hash includes it
           - if not, assign it and add index to value array
           - if yes, add index to value array
        - return hash
=end


def map_letters(str)
  result = {}
  str = str.chars
  str.each_with_index do |letter, index|
    if result.include?(letter.to_sym)
      result[letter.to_sym] << index
    else
      result[letter.to_sym] = [index]
    end
  end
  result
end

p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }
