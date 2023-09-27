require 'pry'
=begin
P: given a number as an argument, representing a number of switches, return an array
   with the lights left on after the same number of times being switched. the switches are toggled
   in increasing intervals, starting with one (every switch), then 2 (every second switch)
  i: number (n)
  o: array of on switches

E: n = 5 lights
   round 1: every light is turned on
   round 2: lights 2 and 4 are now off; 1, 3, 5 are on
   round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
   round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
   round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
   Answer: [1, 4]

A: - set a toggle to true
   - create an array of toggles, with n elements
   - n times, loop over the array
     - at each interval, whichever (indexes plus +1) divide evenly by current number, toggle toggle
     to other toggle option
     ex: [true, true, true, true, true]
       all the (indexes + 1) that divide by 2, change toggle to !toggle
   - at the end, return the count of falses
     - get the index + 1 of each false toggle
=end

def lights(n)
  toggle = true
  arr = []
  n.times {|num| arr << toggle}

  counter = 1
  loop do
     arr = arr.map.with_index do |toggle, index|
       if (index + 1) % counter == 0
         !toggle
       else
         toggle
       end
     end
     counter += 1
     break if counter == (n + 1)
  end
  
  results = []
  arr.each_index{|index| results << (index + 1) if arr[index] == false}
  results
end

p lights(1000)
