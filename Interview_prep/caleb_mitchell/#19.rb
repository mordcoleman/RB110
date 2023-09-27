
# Given a word, compute the Scrabble score for that word
# A, E, I, O, U, L, N, R, S, T = 1
# D, G = 2
# B, C, M, P = 3
# F, H, V, W, Y = 4
# K = 5
# J, X = 8
# Q, Z = 10
=begin
P: given a string, return  the score for the word
  i: String
  o: integer

E/D:   scrabble_score('cabbage') == 14
       scrabble_score('Cabbage') == 14

A: high:  hashes of all letter -score pairs, iterate over chars in word, adding values as you go

   low: - create array of hashes of arrays letters and score
        - init score variable
        - iterate over chars
          - check which hash includes it
             {[B, C, M, P] => 3}
            - add the value of that hash to sum
            'cabbage'
             c is in the 3 hash
         - return the sum
=end
def scrabble_score(str)
  hashes = [{%w(A E I O U L N R S T) => 1},
            {%w(D G) => 2},
            {%w(B C M P) => 3},
            {%w(F H V W Y) => 4},
            {%w(K) => 5},
            {%w(J X) => 8},
            {%w(Q Z) => 10}
  ]

  score = 0
  str = str.chars
  str.each do |letter|
    hashes.each do |hash|
     hash.each do |k, v|
      score += v if k.include?(letter.upcase)
     end
    end
  end
  score
  end

  p scrabble_score('a') == 1
  p scrabble_score('cabbage') == 14
  p scrabble_score('Cabbage') == 14
  p scrabble_score('zebra') == 16


=begin


# Given a word, compute the Scrabble score for that word
# A, E, I, O, U, L, N, R, S, T = 1
# D, G = 2
# B, C, M, P = 3
# F, H, V, W, Y = 4
# K = 5
# J, X = 8
# Q, Z = 10

# E: scrabble_score('a') == 1
# score = 0 + 1

# * cabbage 3+ 1+3 +3



hash = { A=> 1,
         B => 3,
         C => 4,}



def scrabble_score(letters)
  total_score = 0

  letters.chars.each do |char|
    total_score += SCORES2[char.downcase]
  end
  total_score
end

p scrabble_score('a') == 1
p scrabble_score('cabbage') == 14
p scrabble_score('Cabbage') == 14
p scrabble_score('zebra') == 16

=end
