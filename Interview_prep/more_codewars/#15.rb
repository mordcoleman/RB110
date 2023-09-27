=begin
P: given an array of 'direction' strings, return whether or not it will take 10
   min(10 directions), and whether it will bring you back to your place
  i: array
  o: boolean

E/D: is_valid_walk(['n','s','n','s','n','s','n','s','n','s'] --> true
         10 directons and equal pairs

A: high: check for 10 directions, then get hash of directions and count. if they are all equal,
         it's true, otherwise false

     low: -  check the size of the array
            - if not 10, return false
          - otherwise, get hash of all directions and count
          - check if all are equal
             - get values to an array, check all against arr[0]
           - if yes true, otherwise false
=end

def is_valid_walk(arr)
  return false if arr.size != 10

  hash = {}

  arr.each do |el|
    if hash.include?(el)
      hash[el] += 1
    else
      hash[el] = 1
    end
  end

  n_s = hash.select {|k,v| k == 'n' || k == 's'}
  w_e = hash.select {|k,v| k == 'w' || k == 'e'}

  n_s = n_s.to_a
  w_e = w_e.to_a

  if n_s.all?{|sub| sub[1] == n_s[0][1]} && w_e.all?{|sub| sub[1] == w_e[0][1]}
    true
  else
    false
  end

end

p is_valid_walk(['s', 'e', 'w', 'n', 'n', 's', 'e', 'w', 'n', 's'])
