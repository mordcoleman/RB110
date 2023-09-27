=begin
P: given three numbers rep. three angles of a triangle, return the type or invalid
  i: 3 numbers
  o: symbol
  rules: - triangle is invalid if sum of sides is not 180 or one side is 0
          - right: one angle is 90,
          - acute: all three are less than 90,
          - obtuse: one is > 90

E/D: triangle(60, 70, 50) == :acute none over 90

array

A: high: check if sum isn't 90 or if there's a 0, then if one is 90, all are less then
        90

   low: - init array, push angles in
        - check if sum isn't 180 or includes 0, return invalid
        - check if includes 90, return right
        - check if all are less than 90, return acute
        - otherwise return obtuse

=end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]

  if angles.sum != 180 || angles.include?(0)
    :invalid
  elsif angles.include?(90)
    :right
  elsif angles.all?{|angle| angle < 90}
    :acute
  else
     :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
