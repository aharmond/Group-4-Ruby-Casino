require "pry"
require "colorize"


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
    puts "Great, let's get started!"
    sleep(1)
  end

  def display_main_menu
    puts "-----------------------"
    puts "Main Menu:"
    puts "1)Roulette"
    puts "2)Black Jack"
    puts "3)Slots"
    puts "4)Dice"
    puts "5)Horse Races"
    puts "6) Exit"
    choice = gets.to_i
    case choice
    when 1 # Roulette
      @wallet = Roullette.new(@wallet)

    when 2 # Black Jack
      @wallet = BlackJack.new(@wallet)
    when 3 # Slots
      slots_menu
      @wallet = Slots.new(@wallet)
    when 4 # Dice
      @wallet = Dice.new(@wallet)
    when 5 # Horse Races
      @wallet = HorseRaces.new(@wallet)
    when 6
      exit
    else
      puts "Invalid choice. Try again."
      sleep(1)
      display_main_menu
    end
  end

  def repeat_menu
    #TBD
  end

  def slots_menu
    puts "------------------------------------"
    puts "Welcome to Lucky Money Slot Machine!"
    puts "1) Start a new game"
    puts "2) Access to wallet"
    puts "3) Exit to Main Menu"
    choice = gets.to_i
    case choice
    when 1
      start_game
    when 2
      access_wallet
    when 3
      display_main_menu
    end
  end

  def start_game
    puts "Place your bet: "
    @slots_bet = gets.to_i
    if @slots_bet > @wallet
      puts "You only have $#{@wallet}."
      puts "1) Place lower bet."
      puts "2) Access to wallet."
      puts "3) Exit to Main Menu."
      choice = gets.to_i
      case choice
      when 1
        start_game
      when 2
        access_wallet
      when 3
        display_main_menu
      else
        puts "Invalid choice. Try again"
        slots_menu
      end
    else
      puts "Spinning..."
      sleep(3)
      result = Random.new
      puts result = rand(1..30).to_i
      sleep(1)
      if result == 19
        win
      else
        lose
      end
    end
    sleep(2)
    slots_menu
  end

  def win
    puts "Congrats! You win $#{@slots_bet}!"
    puts "Your wallet now has $#{@wallet + @slots_bet}."
  end

  def lose
    puts "Sorry! You lost $#{@slots_bet}"
    puts "Your wallet now has $#{@wallet - @slots_bet}."
    puts "Better luck next time!"
  end


end

# class Roullette
#   # attr_accessor :wallet
  
#   def initialize(wallet_of_this_game)
#     @wallet_of_this_game = wallet_of_this_game
#   end

#   def spin_the_wheel

#     #example game functionality

#     cash_out
#   end

#   def cash_out
#     return @wallet_of_this_game = @wallet_of_this_game + 5
#   end
# end

casino = Casino.new
casino

