require "pry"
require "colorize"

class Slots
  def initialize(player)
    @player = player
    @wallet_slots = player.wallet
    slots_menu
  end
  def slots_menu
    puts "------------------------------------".colorize(:red)
    puts "Welcome to Lucky Money Slot Machine!".colorize(:red)
    puts "1) Start a new game".colorize(:green)
    puts "2) Access to wallet".colorize(:green)
    puts "3) Exit to Main Menu".colorize(:green)
    puts "4) Quit".colorize(:green)
    choice = gets.to_i
    case choice
    when 1
      slots_game
    when 2
      repeat_menu
      #Access to wallet to see available budget or add more money
    when 3
      display_main_menu
      # Return to Main Menu
    when 4
      exit
    else
      puts "Invalid choice. Try again!".colorize(:red)
      slots_menu
    end
  end

  def slots_game
    if @wallet_slots > 0
      puts "Place your bet (min $1): ".colorize(:green)
      @slots_bet = gets.to_i
      if @slots_bet > @wallet_slots
        puts "You only have $#{@wallet_slots}.".colorize(:red)
        puts "Please choose:".colorize(:red)
        puts "1) Place lower bet".colorize(:green)
        puts "2) Access to wallet".colorize(:green)
        puts "3) Exit to Main Menu".colorize(:green)
        choice = gets.to_i
        case choice
        when 1
          slots_game
        when 2
          repeat_menu
          #Access to wallet to see available budget or add more money
        when 3
          display_main_menu
          # Return to Main Menu
        else
          puts "Invalid choice. Try again".colorize(:red)
          slots_menu
        end
      else
        puts "Spinning...".colorize(:blue)
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
      puts "You don't have enough money.".colorize(:red)
      sleep(1)
      display_main_menu
      # Return to Main Menu
    end
  end

  def win
    @wallet_slots += @slots_bet
    puts "YOU WIN!".colorize(:green)
    puts "Your wallet now has $#{@wallet_slots}.".colorize(:green)
    puts "Congrats!".colorize(:green)
  end

  def lose
    @wallet_slots -= @slots_bet
    puts "YOU LOSE!".colorize(:green)
    puts "Your wallet now has $#{@wallet_slots}.".colorize(:green)
    puts "Better luck next time!".colorize(:green)
  end

  def sub_menu
    puts "-----------------".colorize(:red)
    puts "Would you like to".colorize(:red)
    puts "1) Play again".colorize(:green)
    puts "2) Exit to Main Menu".colorize(:green)
    choice = gets.to_i
    case choice
      when 1
        slots_game
      when 2
        display_main_menu
        # Return to Main Menu
      else
        puts "Invalid choice. Try again".colorize(:red)
        slots_menu
    end
  end

end
