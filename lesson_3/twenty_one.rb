SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
          'Jack', 'King', 'Queen', 'Ace']

def prompt(msg)
  puts "=> #{msg}"
end

def welcome_message
  prompt "Welcome to 21!"
end

def deck
  SUITS.product(VALUES).shuffle
end

def deal_card(contestant)
  contestant << deck.pop
end

def initial_deal(player, dealer)
  2.times do
    deal_card(player)
    deal_card(dealer)
  end
end

def dealer_turn(contestant, dealer_total)
  loop do
    break if dealer_total >= 17
    deal_card(contestant)
  end
end

def bust_check(contestant_total)
  contestant_total > 21
end

def calculate_score(contestant)
  tally = contestant.map { |card| card[1] }

  total = 0
  tally.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  tally.select { |value| value == "Ace" }.count.times do
    total -= 10 if total > 21
  end
  total
end

def who_won(player, dealer, dealer_total, player_total)
  puts
  if bust_check(dealer_total)
    prompt "Dealer Busted, You Win!!"
  elsif player_total > dealer_total
    prompt "You win!"
  elsif player_total < dealer_total
    prompt "Dealer wins!"
  else
    prompt "Tie"
  end
end

def display_results(player, dealer, player_total, dealer_total)
  puts
  puts "Your cards #{player}"
  puts "Dealer's cards #{dealer}"
  p "Your total:#{player_total}"
  p "Dealer's total: #{dealer_total}"
end

def play_again
  loop do
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp
    if answer.start_with?("Y", "y")
      return "yes"
    elsif answer.start_with?("N", "n")
      return "no"
    else
      prompt "Sorry, invalid response."
    end
  end
end

# Game
loop do
  system 'clear'
  loop do
    welcome_message
    player = []
    dealer = []

    initial_deal(player, dealer)

    player_total = calculate_score(player)
    dealer_total = calculate_score(dealer)

    puts "Here are your first cards:
    #{player},for a total of #{player_total}."
    puts "Here's one of the dealer's cards: #{dealer.sample}"

    loop do
      answer = ''
      loop do
        prompt "Would you like to hit or stay? (h/s)"
        answer = gets.chomp.downcase
        break if answer.include?("h") || answer.include?("s")
        prompt "Invalid response. Please enter 'h' or 's'."
      end
      if answer == 'h'
        deal_card(player)
        player_total = calculate_score(player)
        puts "Your cards are now: #{player}"
        p "Your total is now :#{player_total}"
      end
      break if answer.include?("s") || bust_check(player_total)
    end

    if bust_check(player_total)
      display_results(player, dealer, player_total, dealer_total)
      prompt "You busted!! Game Over."
      break
    end

    system 'clear'
    prompt "Dealer's turn.."

    loop do
      break if dealer_total >= 17

      prompt "Dealer's hits!"
      deal_card(dealer)
      dealer_total = calculate_score(dealer)
      puts
      puts "Dealer's cards are now: #{dealer}"
      bust_check(dealer_total)
    end

    if bust_check(dealer_total)
      display_results(player, dealer, player_total, dealer_total)
      prompt "Dealer busted! You win!"
      break
    else
      puts "Dealer stays at #{dealer}"
    end
    display_results(player, dealer, player_total, dealer_total)
    who_won(player, dealer, dealer_total, player_total)
    break
  end
  break if play_again == "no"
end

prompt "Thanks for playing! Bye bye!"
