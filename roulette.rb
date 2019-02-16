require "pry"
require "colorize"

class Roulette
    attr_accessor :wallet, :roulette_wheel, :bet_array, :winning_number
    
    def initialize(wallet)
      @wallet = wallet
      @bet_array = []
      build_game_instance

      # Choose where you put your chips & your wallet amount
      # Must not allow for more betting than you have in your wallet
      place_bets

      # Spin the wheel & randomly choose the winning number
      spin_the_wheel
  
      # Calculate the winnings for the user, and add to wallet
      calculate_winnings

      # Play again or cash out & exit
      repeat_game

    end

    def build_game_instance
      @roulette_wheel = (0..36).to_a
      @roulette_wheel.push("00")
      @roulette_wheel.each_with_index do |number,index|
          @roulette_wheel[index] = number.to_s
      end

      @bet_options = ["00","red","black","odd","even","1-18",
        "19-36","1-12","13-24","25-36"]
      @bet_options.push((0..36).to_a)
      @bet_options.flatten!
      # binding.pry
      @bet_options.each_with_index do |number,index|
        @bet_options[index] = number.to_s
      end
    
 
    end


    def place_bets
      @roulette_wheel
      puts "\n-----------------------"
      puts "Your wallet currently has $#{@wallet}\n"
      puts "What do you want to bet on?"
      print "> "
      bet_option = gets.strip.downcase
      puts "And how much do you want to bet on that?"
      print "> $"
      bet_amount = gets.to_i
      
      # Tests whether user has enough funds to make the bet
      if bet_amount > @wallet
        puts "Not enough funds!"
        puts "Try a different bet amount, or exit."
      else # Saves the bet, and withdraws funds from wallet
        @bet_array.push(Bet.new(bet_option,bet_amount))
        @wallet -= bet_amount
      end

      continue_bets # Identifies whether the user wants to keep betting more
      
    end



    def continue_bets
      puts "Do you want to bet anything else? (y/n)"
      choice = gets.strip.downcase
      case choice
      when "y"
        place_bets
      when "n"
        return
      else
        puts "Invalid Choice"
        continue_bets # repeats loop
      end
    end
  

    # Allows user to spin the wheel
    def spin_the_wheel
      puts "All Bets In"
      puts "To spin the wheel, press 'Enter'."
      print "> "
      #TBD

      @winning_number = roulette_wheel.sample
      
      # DEBUG
      # @winning_number = "5" 

      puts "The ball landed on: #{@winning_number}!\n"
    end


    # Calculates the winnings of the spin based on the user's bets
    def calculate_winnings
      # Calculate numbers
      winnings_amount = 0
      bet_lost_flag = true

      #check whether the number is 
      @bet_array.each_with_index do |bet,index|
        if bet.bet_option == @winning_number
          puts "You won!"
          winnings_amount = bet.bet_amount * 34
          bet_lost_flag = false
        end
      end
      # binding.pry

      
      if bet_lost_flag
        puts "Sorry, you did not win anything!"
      end

      # Adds winnings to user's wallet
      add_winnings(winnings_amount)

    end



    def add_winnings(winnings_amount)
      @wallet += winnings_amount
    end



    def repeat_game
      puts "\n-----------------------"
      puts "You currently have $#{@wallet} left.".colorize(:blue)
      puts "What would you like to do next?"
      puts "1) Play Again"
      puts "2) Cash Out"
      print "> "
      choice = gets.to_i
      case choice
      when 1
        initialize
      when 2
        cash_out
      else
        puts "invalid entry, try again"
        repeat_game
      end      
    end


    # Allows user to cash out and exit the game
    def cash_out
      # puts @wallet
      return @wallet
    end
  end


# Types of bets:
# - red/black
# - odd/even
# - 00
# - 1-12
# - 13-24
# - 25-36
# - 1-18
# - 19-36
class Bet
  attr_accessor :bet_option, :bet_amount
  def initialize(bet_option,bet_amount)
    @bet_option = bet_option
    @bet_amount = bet_amount
  end
end
  
# Roulette.new()