=begin
P: given 2 strings, return true if a some letters in first can be arranged to
   match second
  i: 2 strings
  o: boolean

E/D: scramble('rkqodlw', 'world') ==> True

string, array

A: - convert both to arrays
   - iterate over second, selecting only the letters which exist in the first to new array
   - compare new array with second
     - if equal, return true, else false
=end

def scramble(str1, str2)
 str1 = str1.chars
 str2 = str2.chars

 new_arr = str2.select do |char|
          str1.include?(char)
 end

 new_arr == str2
end


p scramble('rkqodlw', 'world')
p scramble('cedewaraaossoqqyt', 'codewars')
p scramble('katas', 'steak')
p scramble('scriptjava', 'javascript')
p scramble('scriptingjava', 'javascript')
