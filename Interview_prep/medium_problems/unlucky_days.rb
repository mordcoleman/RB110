=begin
P: given a number(year), retrun the # of Friday the 13ths in that year
  i: integer
  o: integer
  explicit: year is more than 1752

=end
require 'date'

def friday_13th(year)
  count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do |time|
    count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  count
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
