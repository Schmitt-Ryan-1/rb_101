=begin
- We are creating a command line rock paper scissors game where the user plays against the computer.
- inputs - usre inputs 'rock', 'paper' or 'scissors'
- output user's choice, computer's random choice and the results of the game
- alg...
  Establish a constant of the three choices
  create prompt method - just practice usinga nd calling methods
  create a method for the game logic - outside game loop to make reading and problem solving easier
  obtain user choice - prompt and gets, validate legit choice
  generate computer choice choices.sample
  call logic method with user and computer choices that will print result
  prompt user to play again
=end

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!!!")
  elsif win?(computer, player)
    prompt("You lose!!!")
  else
    prompt("It's a tie!!!")
  end
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      puts "That is not a valid choice, please try again."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, the computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Would you like to play again? 'Y' for yes, 'N' for no.")
  again = gets.chomp.upcase
  break unless again == "Y"
end

puts "Thanks for playing!!"
