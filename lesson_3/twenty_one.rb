require 'pry'
=begin
---------------- Problem
Input:
Output:

---------------- Examples (modeling)



---------------- Data Structures
Hashes


---------------- Algorithm
(Break down by what needs to happen and what needs to be controlled)
1. Initialize deck
2. Deal cards to player and dealer
  - select 2 random cards from deck and pass to player and dealer
  - show all players cards and one of the dealers cards
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end
SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
VALUES = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', "Jack", "King", "Queen"]

def deal_card(person)
  person << [(SUITS.sample) + ", " + (VALUES.sample)]
end

player = []
dealer = []

loop do
  deal_card(player)
  break if player.size == 2
end

loop do
  deal_card(dealer)
  break if dealer.size == 2
end
p player
p dealer
