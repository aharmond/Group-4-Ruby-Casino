require "pry"
require "colorize"
require_relative "dice"
require_relative "player"
require_relative "horse_races"

class Casino
  def initialize
    
    # Welcome
    # Get Input - user name & wallet amount
    get_user_input

    # Display Menu and receive input:
    # List out the individual games (each is a class)
    display_main_menu

    # Requirements for every game:
    # - Don't let the user keep playing if they are out of money
    # - Must return the current wallet amount (int)
    # - Minimum bet is $1
    # - Constantly display wallet amount, each round of the game
  
  


    # Print out final wallet amount after each game 
    # Allow user to play a new game
    # Allow user to add more money into the wallet
    # allow user to exit the application
  end

  def get_user_input
    puts "Welcome to Money City!"
    puts "What is your name?"
    @name = gets.strip
    puts "How much money do you want to add to your wallet today?"
    @wallet = gets.to_i
    @player = Player.new(@name, @wallet)
    puts "Great, let's get started!"
    sleep(1)
  end

  def display_main_menu
    puts "You have $#{@wallet}."
    puts "-----------------------"
    puts "Main Menu:"
    puts "1)Roulette"
    puts "2)Black Jack"
    puts "3)Slots"
    puts "4)Dice"
    puts "5)Horse Races"
    choice = gets.to_i
    case choice
    when 1 # Roulette
      Roullette.new(@player)
    when 2 # Black Jack
      BlackJack.new(@player)
    when 3 # Slots
      Slots.new(@player)
    when 4 # Dice
      Dice.new(@player)
    when 5 # Horse Races
      HorseRaces.new(@player)
    end
  end

  def repeat_menu
    #TBD
  end


end

# class Roullette
#   # attr_accessor :player
  
#   def initialize(player)
#     @player = player
#     @wallet_game = player.wallet
#   end

#   def spin_the_wheel

#     #example game functionality

#     cash_out
#   end

#   def cash_out
#     player.wallet = @wallet_game
#   end
# end

Casino.new