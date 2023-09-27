=begin
P: given 2 strings, return true if they both have a common substring
   i: 2 strings
   o: boolean
  implicit: case insensitive, substring must be at least 2 chars

E/D: substring_test('Something', 'Home') == true (both contain 'ome')
     substring_test('BANANA', 'banana') == true  (both contain all letters)
     substring_test('', '') == false (neither contain any substring)

A: high: - get all substrings for each word, check if any are the same

   low: - iterate over each word, saving all possible subs to seperate arrays
        - take first array, iterate over it
          - at each iteration, check if any subs in second array equal it
          - if none return false
          -else return true
        - if both are empty, return false
=end


def substring_test(string1, string2)
  string1 = string1.downcase.chars
  string2 = string2.downcase.chars

  arr1= []
  arr2 = []


  0.upto(string1.size - 1) do |idx1|
    idx1.upto(string1.size - 1) do |idx2|
      arr1 << string1[idx1..idx2]
    end
  end

  0.upto(string2.size - 1) do |idx1|
    idx1.upto(string2.size - 1) do |idx2|
      arr2 << string2[idx1..idx2]
    end
  end

  arr1.each do |sub|
    arr2.each do |sub2|
      return true if sub == sub2 && sub.size > 1
    end
  end
  false
end




p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

