=begin
ROCK PAPER SCCISSORS LIZARD SPOCK 
- starting with rock paper scissors game create a command line rpsls game that keeps score. 
- inputs - user choice, computer choice, play again
- outputs - choices, winner, play again, score

- define valid choices for input in an array
- define valid choices as values in a hash that has a choice and then the two choices that it beats
- define a method for who wins. If player choice in CHOICES hash has the computer choice as a value the player wins. If the user and computer choices are different and the value for the computer choice is not a value for the user choice key then the computer wins. This seems more simple than checking computer choice as CHOICES key, but if user choice is a value for the computer choice key then the computer wins.
- print result meggage with scoreboard update.
=end

system("clear")

VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

def prompt(message)
  puts("=> #{message}")
end

# this hash has keys with possible user and computer choices. If a choice has a value that = oponent's choice then the player who chose that key wins
CHOICES = {
  rock: ['lizard', 'scissors'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['rock', 'scissors'],
  lizard: ['paper', 'spock']
}

player_score = 0
computer_score = 0

# This method takes choices and compares them using the CHOICES hash
# this method contains the game logic of what coice beats what
def display_results(player_choice, computer_choice)
  if player_choice == computer_choice
    puts "It's a tie"
  elsif CHOICES[player_choice.to_sym].include?(computer_choice)
    puts "You Win!"
  else
    puts "You lose!"
  end
end

def rules
  puts "Welcome to Rock Paper Scissors Lizard Spock!
  ____________________________ 
  Best two out of three.
  Scissors cut Paper.
  Paper covers Rock.
  Rock crushes Lizard.
  Lizard poisons Spock.
  Spock smashes Scissors.
  Scissors decapitates Lizard.
  Lizard eats Paper.
  Paper disproves Spock.
  Spock vaporizes Rock.
  Rock crushes Scissors."
end

# this is the main loop that runs through player choice, validates that choice, generates computer choice randomly, then compares these choices in the CHOICES hash to see eho wins or if the game is a tie
loop do
  rules
  player_choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.strip.downcase #gets input from user, downcases in case user input a capital letter somewhere, strips any white space

    if VALID_CHOICES.include?(player_choice)
      break
    else
      puts "That is not a valid choice, please try again."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{player_choice}, the computer chose #{computer_choice}")

  display_results(player_choice, computer_choice)

  if player_choice = computer_choice
  elsif CHOICES[player_choice.to_sym].include?(computer_choice)
    player_score += 1
  else
    computer_score += 1
  end

  # Play again message and prompt
  puts "Your score is #{player_score}"
  puts "The cpmputer's score is #{computer_score}"
  prompt("Would you like to play again? 'Y' for yes, 'N' for no.")
  again = gets.chomp.upcase
  break unless again == "Y"
  system("clear")

end
system("clear")
puts "Thanks for playing!"