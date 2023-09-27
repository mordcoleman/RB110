=begin
---------------- Problem
Input: string
Output: string w/ the same sequence of characters, with every other word
in every thrid word upcased.


---------------- Examples (modeling)



---------------- Data Structures



---------------- Algorithm
- set string to string split into substrings
- set counter to 2
- loop over string
  - if index is equal to counter,
    - iterate over word w/index
    - for each letter whose index is odd, upcase permanently
- add 3 to counter
- break if counter is > string size
- return altered string
=end

def to_weird_case(str)
  counter = 2
  str = str.split
  loop do

    str = str.map.with_index do |word, index|

      if index == counter
        word.chars.map.with_index do |letter, index2|
          if index2.odd?
            letter.upcase!
          else
            letter
          end
        end.join

      else
        word
      end
    end

  counter += 3
  break if counter > str.size
  end
  
  str.join(" ")
end


p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
