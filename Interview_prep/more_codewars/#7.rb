=begin
P: given an array of words, return a new word composed of one letter from each,
  with that letter being from increasing indecies, 0 from the first, 1 from the second etc..
  i: array
  o: string

E/D: ["yoda", "best", "has"]  -->  "yes"
       ^        ^        ^
       n=0     n=1     n=2

A: high: iterate over the words, using a counter to select a letter at increasing intervals

   low: - counter at zero
        - init results array
        - at each word, increase counter and select letter at counter index
        - push to results array, and return  in string form
=end

def nth_char(arr)
  counter = 0
  results = []

  arr.each do |word|
    results << word[counter]
    counter += 1
  end
  results.join
end



p nth_char(['yoda', 'best', 'has'])
