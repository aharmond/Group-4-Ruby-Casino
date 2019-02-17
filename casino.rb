require "pry"
require "colorize"

require_relative "roulette"
require_relative "dice"
require_relative "player"
require_relative "horse_races"


class Casino
  def initialize
    # Welcome Message
    # Get Input - user name & wallet amount
    get_user_input

    # Display Menu and receive input:
    # List out the individual games (each is a class)
    display_main_menu

    # Loops back through the menus for continual playing
    # Allows the user to exit the application if they want to
    repeat_menu

  end


  #
  def get_user_input
    puts "Welcome to Money City!"
    puts "What is your name?"
    print "> "
    @name = gets.strip
    puts "How much money do you want to add to your wallet today?"
    print "> $"
    @wallet = gets.to_i

    puts "\nGreat, let's get started!"

    sleep(1)
  end


  # Requirements for every game:
  # - Don't let the user keep playing if they are out of money
  # - Must return the current wallet amount (int)
  # - Minimum bet is $1
  # - Constantly display wallet amount, each round of the game
  def display_main_menu
    puts "\nMain Menu".colorize(:blue)
    puts "\n-----------------------".colorize(:blue)
    puts "You currently have $#{@wallet}".colorize(:blue)
    puts "Please select one of the following:".colorize(:blue)
    puts "1)Roulette".colorize(:blue)
    puts "2)Black Jack".colorize(:blue)
    puts "3)Slots".colorize(:blue)
    puts "4)Dice".colorize(:blue)
    puts "5)Horse Races".colorize(:blue)
    puts "6)Additional Options".colorize(:blue)
    puts "-----------------------".colorize(:blue)
    print "> "
    choice = gets.to_i
    case choice
    when 1 # Roulette
      Roulette.new(@wallet)
    when 2 # Black Jack - Josh
      @wallet = BlackJack.new(@wallet)
    when 3 # Slots - Thanh
      @wallet = Slots.new(@wallet)
    when 4 # Dice - AJ
      @wallet = Dice.new(@wallet)
    when 5 # Horse Races - Jake
      @wallet = HorseRaces.new(@wallet)
    when 6
      repeat_menu
    else
      puts "Invalid input, try again."
      sleep(1)
      display_main_menu
    end
  end

  
  # Print out final wallet amount after each game 
  # Allow user to add more money into the wallet
  # Allow user to play a new game
  # allow user to exit the application
  def repeat_menu
    puts "\n-----------------------".colorize(:blue)
    puts "You currently have $#{@wallet} left.".colorize(:blue)
    puts "What do you want to do?".colorize(:blue)
    puts "1)Add more money to my wallet".colorize(:blue)
    puts "2)Play another game".colorize(:blue)
    puts "3)Exit".colorize(:blue)
    puts "-----------------------".colorize(:blue)
    print "> "
    choice = gets.to_i
    case choice
    when 1
      add_money_to_wallet
      display_main_menu
    when 2
      display_main_menu
    when 3
      puts "\nGoodbye!"
      sleep(1)
      print `clear`
      exit
    end
  end


  # Allows the user to add any amount of money (integer)
  # to their wallet for future games.
  def add_money_to_wallet
    puts "\n-----------------------"
    puts "How much more money do you want to add?"
    print "> $"
    new_money = gets.to_i
    @wallet = @wallet + new_money
    puts "Your wallet now has: $#{@wallet}"
  end
end

Casino.new