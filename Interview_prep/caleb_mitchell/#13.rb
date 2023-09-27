=begin
P:
=end

def common_prefix(arr)
  master = arr[0]
  results = []
  master.chars.each_with_index do |letter, index|
    results << letter if arr.all?{|sub| sub[index] == letter }
  end
  results.join
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"
