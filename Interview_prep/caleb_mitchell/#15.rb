=begin
P: given 2 strings, return true if any substring in str1 can be rearranged
   to match str 2, otherwise false

E/D: scramble('javaass', 'jjss') == false
     scramble('rkqodlw', 'world') == true

   A: -
=end

def scramble(str1, str2)
  str1 = str1.chars
  str2 = str2.chars

  str2.all?{|letter| str1.count(letter) >= str2.count(letter)}
end


 p scramble('rkqodlw', 'world') == true
 p scramble('cedewaraaossoqqyt', 'codewars') == true
 p scramble('katas', 'steak') == false
 p scramble('scriptjava', 'javascript') == true
 p scramble('scriptingjava', 'javascript') == true
