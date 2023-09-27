require 'pry'
=begin
P: given a word, return true if word can be spelled from collection of 'spelling blocks',
   - block, which is pair of 2 leeters, can only be used 1 time, or one letter.
  i: string
  o: boolean

E / D: block_word?('BATCH') == true
       block_word?('BUTCH') == false
       block_word?('jest') == true

       array(original blocks), array(of chars), array(store used blocks)

A:  high: check if each letter is on a block that has been used already or not, if it isn't, remove block
        and move to next letter

    issues: how to check blocks for individual lettrs?
              - use include? on each block, first break blocks into subarrays

    low:  - init 'used' array, for used blocks
          - iterate over word
            - convert into array of chars
            - upcase all chars to match blocks
          - check if char is still in block array
              - iterate over block array to check it's subarrays
              if so, remove and add to used array
          - check if used array has doubles
=end
BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]
def block_word?(str)
  used = []
  str = str.upcase.chars

  str.each do |letter|
    BLOCKS.each do |block|
      used << block if block.include?(letter)
    end
  end
  used == used.uniq
end



p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
