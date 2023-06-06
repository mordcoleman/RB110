require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INTIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
ROUNDS_TO_WIN = 5
CENTRE_SQUARE = 5
def prompt(msg)
  puts "=> #{msg}"
end

def welcome_message
  prompt "Hello Clare or Brandi! Welcome to Tic Tac Toe!"
  prompt "First to win 5 round wins."
end

def joinor(arr, a = nil, b =nil)
  if arr.size == 1
    arr.join
  elsif arr.size == 2
    arr.join.insert(-2, " or ")
  elsif a == "; "
    arr.join("; ").insert(-2, "or ")
  elsif a == ", " && b == 'and'
    arr.join(", ").insert(-2, "and ")
  else
    arr.join(", ").insert(-2, "or ")
  end
end

# rubocop: disable  Metrics/AbcSize
def display_board(brd)
  # system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |      |"
  puts "  #{brd[1]}  |   #{brd[2]}  |  #{brd[3]}"
  puts "     |      |"
  puts "-----+------+-----"
  puts "     |      |"
  puts "  #{brd[4]}  |   #{brd[5]}  |  #{brd[6]}"
  puts "     |      |"
  puts "-----+------+-----"
  puts "     |      |"
  puts "  #{brd[7]}  |   #{brd[8]}  |  #{brd[9]}"
  puts "     |      |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INTIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INTIAL_MARKER }
end

def player_places_piece!(brd)
  prompt "Choose a square to place a piece: #{joinor(empty_squares(brd))}"
  square = ''
  loop do
    answer = gets.chomp
    square = answer.to_i if answer.include?('.') == false
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = computer_strategy(line, brd)
    break if square
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def whos_on_first
  prompt "Who should go first? Select 'p' for player, 'c' for computer,
    or 'r' for Random:"
  answer = ''
  loop do
    answer = gets.chomp.downcase
    if answer == "r"
      return ["c", "p"].sample
    elsif answer == "c" || answer == "p"
      return answer
    end
    prompt "Sorry, that's not a valid choice."
  end
end

def place_piece!(board, current_player)
  current_player = ["c", "p"].sample if current_player == "r"
  if current_player == "p"
    player_places_piece!(board)
  elsif current_player == "c"
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == "p" ? "c" : "p"
end

def computer_strategy(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select do |key, val|
      line.include?(key) && val == INTIAL_MARKER
    end.keys.first
  elsif brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select do |key, val|
      line.include?(key) && val == INTIAL_MARKER
    end.keys.first
  elsif brd[CENTRE_SQUARE] == INTIAL_MARKER
    CENTRE_SQUARE
  end
end

def display_score(score)
  p "Player Score = #{score[0]}"
  p "Computer Score = #{score[1]}"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def display_results(board)
  if someone_won?(board)
    puts "#{detect_winner(board)} won!"
  else
    puts "It's a tie!"
  end
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

def score_tracker(winner, score)
  winner == "Player" ? score[0] += 1 : score[1] += 1
end
# Game Logic
loop do
  score = [0, 0]
  system 'clear'
  welcome_message
  loop do
    board = initialize_board
    display_board(board)
    current_player = whos_on_first
    system 'clear'
    loop do
      display_board(board)
      display_score(score)
      place_piece!(board, current_player)
      system 'clear'
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_results(board)
    winner = detect_winner(board)
    score_tracker(winner, score)
    display_score(score)
    final(winner, score)
    if score.include?(ROUNDS_TO_WIN)
      prompt "Game Over. #{winner} wins!"
      break
    end
  end
  break if play_again == "no"
end
prompt "Thanks for playing Tic Tac Toe! Good bye!"
