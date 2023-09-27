=begin
P: given a string, return number of characters that appear more than once
  i: string
  o: number
  rules: case insensitive

E/ D:  "abcde" -> 0  # no characters repeats more than once
       "aabbcde" -> 2  # 'a' and 'b'
       "aabBcde" -> 2  # 'a' occurs twice and 'b' twice (`b` and `B`)
     array - hash(to add chars to)

A:  - init results hash
    - convert string to array
    - iterate over array, adding char and number of times to hash
    - return all chars that have values more than 1
    - add up keys and return
=end

def duplicate_count(string)
  results = {}

  string = string.downcase.chars

  string.each do |char|
    if results.include?(char)
      results[char] += 1
    else
      results[char] = 1

    end
  end
  results.select {|_, v| v > 1}.size
end


p duplicate_count("abcdeaa") #== 1
