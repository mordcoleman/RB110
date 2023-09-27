=begin
P: given a string, count lowercase letters, returned a hash with letter as key
   and count as value. key must be symbol
  i: string
  o: hash

E/D: letterCount('arithmetics')
          #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

    string, array, hash

A: - convert string to array of characters
   - initialize hash
   - iterate through array, adding key and/ or plus 1 to value
   - return hash
=end

def letter_count(str)
  arr = str.chars
  arr.map! {|char| char.to_sym}
  result_hash = {}
  arr.each do |char|
    if result_hash.include?(char)
      result_hash[char] += 1
    else
      result_hash[char] = 1
    end
  end
  result_hash.sort.to_h
end


p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
