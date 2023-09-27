require 'pry'
=begin
P: given an integer, return  number in expanded form
  i: integer
  o: string

E/D: expanded_form(70304); # Should return '70000 + 300 + 4'

A: high: iterate over number, for each place, * num by 1 and zeroes of rest of places
        add to result to array

    low:  convert num to array of nums
          create results array
          iterate, for each number, * by the string 1 + size -1 zeroes, add result to array
          remove all zeroes from array
          print array
=end

def expanded_form(num)
  num = num.to_s.chars
  results = []

  times = (num.size - 1)
  num.each do |i|
    zeroes = []
    (times).times {|time| zeroes << '0'}
    results << (i.to_i * ('1' + "#{zeroes.join}").to_i)
    times -= 1
  end
  final = results.select {|num| num != 0}
  p final.map! {|num| num.to_s}
  final[0...-1].each {|number| puts "#{number}" }
  # p final.last
end

expanded_form(12)
#expanded_form(70304)
