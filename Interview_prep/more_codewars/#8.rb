=begin
P: given a string, find a minimum substring and the max number, such that the entire
   string is equal to the substring that amiunt of times
  i: string
  o: array containing substring and number

E/D: - f("ababab"), ["ab", 3]

A: high: get all substrings, then multiply each by string size divided by it's size to see if we get
        the string. save both to an array and return
   low: - init sub array
        - retrieve all subs
        - select sub that equals string when * strings's size/ it's size
=end

def f(str)
  result = nil
  subs = []
  str = str.chars

  0.upto(str.size - 1 )do |idx1|
    idx1.upto(str.size - 1)do |idx2|
      subs << str[idx1..idx2]
    end
  end
  subs.each do |sub|
    result = [sub.join, (str.size / sub.size)] if sub * (str.size / sub.size) == str
  end
  result
end

p f("ababab")
