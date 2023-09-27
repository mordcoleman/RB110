=begin
P: given a string, return an array of the 3 most occurring words, in descending order
  i: string
  o: array
  explicit: apostrophe is valid part of word
            should be case insensitive, results lowercased
            all other chars are not part of word(.)

E/D: top_3_words("  //wont won't won't")
# => ["won't", "wont"]

A: high: convert to array, get tally, return 3   max by value
    low: - convert string to array
         - get hash of all words and their count
         - iterate over hash, return 3 max_by value
         - iterate over result, returning each string
=end

def top_3_words(string)
  abc = ('a'..'z').to_a
  abc << "'"
  string = string.downcase.split
  string.map! do |word|
    word.chars.map do |char|
      char if abc.include?(char)
    end.join
  end

  hash = {}

  string.each do |word|
    if hash.include?(word) && word != ""
      hash[word] += 1
    else
      hash[word] = 1 if word != ""
    end
  end
  abc = ('a'..'z').to_a
  return [] if (hash.any? {|k,_| abc.include?(k[0])}) == false
  results = hash.max_by(3) {|k, v| v}

  results.map{|sub| sub[0]}
end


#p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
#   mind, there lived not long since one of those gentlemen that keep a lance
#   in the lance-rack, an old buckler, a lean hack, and a greyhound for
#   coursing. An olla of rather more beef than mutton, a salad on most
#   nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
#   on Sundays, made away with three-quarters of his income.")

#p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")

p top_3_words("  , e   .. ")
