require "pry"

class Slots
  def initialize(player)
    @player = player
    @wallet_slots = player.wallet
    slots_menu
  end
  def slots_menu
    puts "------------------------------------"
    puts "Welcome to Lucky Money Slot Machine!"
    puts "1) Start a new game"
    puts "2) Access to wallet"
    puts "3) Exit to Main Menu"
    puts "4) Quit"
    choice = gets.to_i
    case choice
    when 1
      slots_game
    when 2
      # Wallet with viewing budget, adding money and cashing out options
    when 3
      # Return to Main Menu
    when 4
      exit
    else
      puts "Invalid choice. Try again!"
      slots_menu
    end
  end

  def slots_game
    if @wallet_slots > 0
      puts "Place your bet (min $1): "
      @slots_bet = gets.to_i
      if @slots_bet > @wallet_slots
        puts "You only have $#{@wallet_slots}."
        puts "Please choose:"
        puts "1) Place lower bet"
        puts "2) Access to wallet"
        puts "3) Exit to Main Menu"
        choice = gets.to_i
        case choice
        when 1
          slots_game
        when 2
          # Wallet with viewing budget, adding money and cashing out options
        when 3
          # Return to Main Menu
        else
          puts "Invalid choice. Try again"
          slots_menu
        end
      else
        puts "Spinning..."
        sleep(2)
        puts result = rand(1..30).to_i
        sleep(1)
        if result == 19
          win
        else
          lose
        end
        sleep(2)
        sub_menu
      end
    else
      puts "You don't have enough money."
      sleep(1)
      # Return to Main Menu
    end
  end

  def win
    @wallet_slots += @slots_bet
    puts "YOU WIN!"
    puts "Your wallet now has $#{@wallet_slots}."
    puts "Congrats!"
  end

  def lose
    @wallet_slots -= @slots_bet
    puts "YOU LOSE!"
    puts "Your wallet now has $#{@wallet_slots}."
    puts "Better luck next time!"
  end

  def sub_menu
    puts "-----------------"
    puts "Would you like to"
    puts "1) Play again"
    puts "2) Exit to Main Menu"
    choice = gets.to_i
    case choice
      when 1
        slots_game
      when 2
        # Return to Main Menu
      else
        puts "Invalid choice. Try again"
        slots_menu
    end
  end

end
