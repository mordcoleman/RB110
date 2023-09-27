=begin
P: given a string, organize into an array of name, age and and occupation pairs (hashes)
  i: string
  o: array of hashes
  explicit: return empty array if empty string

E/D: organize("John Mayer, 41, Singer, Emily Blunt, 36, Actor") == [
  {:name=>"John Mayer", :age=>"41", :occupation=>"Singer"},
  {:name=>"Emily Blunt", :age=>"36", :occupation=>"Actor"}]

notes: string is ordered properly already
       maybe retrieve subs of three

A: high: iterate over string/ array of words, retrieve subs of three, then iterate over those
          adding each to premade hash as values

   low: - exception for empty
        - init results array
        - init sub_arrs for subarrays
        - iterate over string converted to array, looping every three elements
          - set each element in order to hash keys of name, age, and occupation

=end

def organize(str)
  return [] if str.empty?
  results = []
  subs = []
  str = str.split(", ")

  counter = 0
  loop do
    subs << {name:"#{str[counter]}", age:"#{str[counter + 1]}", occupation:"#{str[counter + 2]}"}
    counter += 3
    break if counter == str.size
   end
  subs
end


p organize("John Mayer, 41, Singer, Emily Blunt, 36, Actor") == [
  {:name=>"John Mayer", :age=>"41", :occupation=>"Singer"},
  {:name=>"Emily Blunt", :age=>"36", :occupation=>"Actor"}
]

p organize("Conan O'Brien, 56, Talk Show Host, Anna Wintour, 69, Editor") == [
  {:name=>"Conan O'Brien", :age=>"56", :occupation=>"Talk Show Host"},
  {:name=>"Anna Wintour", :age=>"69", :occupation=>"Editor"}
]

p organize("") == []
