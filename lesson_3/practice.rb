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

def deal_card(contestant)
  contestant << [(SUITS.sample) + ", " + (VALUES.sample)]
end

def initial_deal(deal_card, contestant)
  loop do
    deal_card(contestant)
    break if contestant.size == 2
  end
end

def show_cards(contestant, cards)
  if cards == 2
    contestant
  else
    contestant.sample
  end
end

player = []
dealer = []

initial_deal(deal_card(player), player)
initial_deal(deal_card(dealer), dealer)

p show_cards(player, 2)
p show_cards(dealer, 1)

p player
p dealer

