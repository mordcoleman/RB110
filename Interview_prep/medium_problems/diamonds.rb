require 'pry'
=begin
P: given an integer, n, display a diamond w/ 4 points on a n by n grid
  i: integer
  o: diamond shape made of asterisks
  rules: argument will always be odd

E/D:  diamond(3)

      *
     ***
      *
    arrays?
A: - find the middle of n (m)
     - divide n / 2 + 1
   - initialize counter to m
   - create a loop that ouputs a asterisk in the middle of n, then on either side of that
      [0..m] spaces, [m], asterisk, [m+1..last] spaces
      increase counter by 2, giving fewer spaces and more asterisks
   - etc, until counter reaches m, then decrease till n
      - (use if else to check state of m)
      - the opposite of above, each time subtracting 2 from counter
   - stop after counter is back to m
=end

def diamond(i)
  return puts '*' if i == 1
  m = (i / 2) + 1
  counter = 1
      loop do
        0.upto(m) {|time| print " "}
        counter.times {|time| print "*"}
        m.upto(i) {|time| print " "}
        counter += 2
        m -= 1
        print "\n"
        break if  counter == i
      end

      loop do
        0.upto(m) {|time| print " "}
        counter.times {|time| print "*"}
        m.upto(i) {|time| print " "}
        counter -= 2
        m += 1
        print "\n"
        break if counter < 1
      end
end

diamond(9)
diamond(1)
diamond(3)
